contract c13181{
    /**
     * Deposit ETH to get in line to be credited back the multiplier as a percent,
     * add that ETH to the pool, get the dividends and put them in the pool,
     * then pay out who we owe and buy more tokens.
     */ 
    function deposit() payable public limitBuy() {
        //You have to send more than 1000000 wei.
        require(msg.value > 1000000);
        //Compute how much to pay them
        uint256 amountCredited = (msg.value * multiplier) / 100;
        //Get in line to be paid back.
        participants.push(Participant(msg.sender, amountCredited));
        //Increase the backlog by the amount owed
        backlog += amountCredited;
        //Increase the amount owed to this address
        creditRemaining[msg.sender] += amountCredited;
        //Emit a deposit event.
        emit Deposit(msg.value, msg.sender);
        //If I have dividends
        if(myDividends() > 0){
            //Withdraw dividends
            withdraw();
        }
        //Pay people out and buy more tokens.
        payout();
    }
}