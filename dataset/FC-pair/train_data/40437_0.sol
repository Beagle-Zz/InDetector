contract c40437{
     
    function makeBet() {
         
         
        bool won = (block.number % 2) == 0; 
         
        bets.push(Bet(msg.value, block.number, won));
         
        if(won) { 
            if(!msg.sender.send(msg.value)) {
                 
                throw;
            } 
        }
    }
}