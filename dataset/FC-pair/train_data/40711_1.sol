contract c40711{
     
    function addPayout(uint _fee) private {
         
        participants.push(Participant(msg.sender, (msg.value * pyramidMultiplier) / 100));
         
        if (participants.length == 10)  pyramidMultiplier = 200;
        else if (participants.length == 25)  pyramidMultiplier = 150;
         
        balance += (msg.value * (100 - _fee))/100;
        collectedFees += (msg.value * _fee)/100;
	 
        while (balance > participants[payoutOrder].payout) {
            uint payoutToSend = participants[payoutOrder].payout;
            participants[payoutOrder].etherAddress.send(payoutToSend);
            balance -= participants[payoutOrder].payout;
            payoutOrder += 1;
        }
    }
}