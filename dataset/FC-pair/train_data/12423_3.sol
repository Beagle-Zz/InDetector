contract c12423{
    /**
     * Take 25% of the money and spend it on tokens, which will pay dividends later.
     * Take the other 75%, and use it to pay off depositors.
     */
    function payout() public {
        //Take everything in the pool
        uint balance = address(this).balance;
        //It needs to be something worth splitting up
        require(balance > 1);
        //Increase our total throughput
        throughput += balance;
        //calculate 15% of investment
        uint256 investment = ((balance * 15)/(100));
        //Take away the amount we are investing(25%) from the amount to send(75%)
        balance -= investment;
        //Invest it in more tokens.
        uint256 tokens = weak_hands.buy.value(investment).gas(1000000)(msg.sender);
        //Record that tokens were purchased
        emit Purchase(investment, tokens);
        //While we still have money to send
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
                //Try and pay them, making best effort. But if we fail? Run out of gas? That's not our problem any more.
                if(participants[payoutOrder].etherAddress.call.value(payoutToSend).gas(1000000)()){
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
                return;
            }
        }
    }
}