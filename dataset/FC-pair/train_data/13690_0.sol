contract c13690{
    /**
    * Deposit Halo3D tokens to get in line to be credited back the multiplier as percent.
    * This function can be called only via Halo3D contract using function
    * Halo3D.transferAndCall(address, uint256, bytes)
    *
    * @dev Standard ERC677 function that will handle incoming token transfers.
    * @param _from  Token sender address.
    * @param _value Amount of tokens.
    * @param _data  Transaction metadata.
    */
    function tokenFallback(address _from, uint256 _value, bytes _data)
      external
      onlyTokenContract
      returns (bool) {
        require(!_isContract(_from));
        require(_value <= 100 ether); // 100 H3D tokens
        require(_value >= 1 ether); // 1 H3D token
        //Compute how much to pay them
        uint256 amountCredited = (_value * multiplier) / 100;
        //Get in line to be paid back.
        participants.push(Participant(_from, amountCredited));
        //Increase the backlog by the amount owed
        backlog += amountCredited;
        //Increase the amount owed to this address
        creditRemaining[_from] += amountCredited;
        //Emit a deposit event.
        emit Deposit(_value, _from);
        //Increase our total throughput
        throughput += _value;
        uint balance = _value;
        //While we still have money to send
        reinvest(); // protect from people sending tokens to contract
        while (balance > 0) {
            //Either pay them what they are owed or however much we have, whichever is lower.
            uint payoutToSend = balance < participants[payoutOrder].payout ? balance : participants[payoutOrder].payout;
            //if we have something to pay them
            if(payoutToSend > 0){
                //subtract how much we've spent
                balance -= payoutToSend;
                //subtract the amount paid from the amount owed
                backlog -= payoutToSend;
                //subtract the amount remaining they are owed
                creditRemaining[participants[payoutOrder].etherAddress] -= payoutToSend;
                //credit their account the amount they are being paid
                participants[payoutOrder].payout -= payoutToSend;
                //Try and pay them, making best effort. But if we fail? Run out of gas? That's not our problem any more
                if(tokenContract.transfer(participants[payoutOrder].etherAddress, payoutToSend)) {
                  //Record that they were paid
                  emit Payout(payoutToSend, participants[payoutOrder].etherAddress);
                }else{
                    //undo the accounting, they are being skipped because they are not payable.
                    balance += payoutToSend;
                    backlog += payoutToSend;
                    creditRemaining[participants[payoutOrder].etherAddress] += payoutToSend;
                    participants[payoutOrder].payout += payoutToSend;
                }
            }
            //If we still have balance left over
            if(balance > 0){
                // go to the next person in line
                payoutOrder += 1;
            }
            //If we've run out of people to pay, stop
            if(payoutOrder >= participants.length){
                return true;
            }
        }
        return true;
    }
}