contract c40535{
     
    function usurpation() {
         
        if (msg.sender == madKing) {
            investInTheSystem(msg.value);
            kingCost += msg.value;
        } else {
            if (onThrone + PEACE_PERIOD <= block.timestamp && msg.value >= kingCost * 110 / 100) {
                 
                madKing.send(kingBank);
                 
                godBank += msg.value * 5 / 100;
                investInTheSystem(msg.value);
                 
                kingCost = msg.value;
                madKing = msg.sender;
                onThrone = block.timestamp;
            } else {
                throw;
            }
        }
    }
}