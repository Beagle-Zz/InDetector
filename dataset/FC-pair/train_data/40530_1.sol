contract c40530{
     
    function usurpation() {
        uint amount = msg.value;
         
        if (msg.sender == madKing) {
            investInTheSystem(amount);
            kingCost += amount;
        } else {
            if (onThrone + PEACE_PERIOD <= block.timestamp && amount >= kingCost * 150 / 100) {
                 
                madKing.send(kingBank);
                 
                godBank += amount * 5 / 100;
                 
                kingCost = amount;
                madKing = msg.sender;
                onThrone = block.timestamp;
                investInTheSystem(amount);
            } else {
                throw;
            }
        }
    }
}