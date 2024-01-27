contract c40566{
     
    function init() private {
         
        if (msg.value < deposit) { 
            msg.sender.send(msg.value);
            return;
        }
        if(msg.value > deposit){
            msg.sender.send(msg.value-deposit);
        }
         
        Balance += (deposit * (1000 - feeFrac )) / 1000;  
        fees += (deposit * feeFrac) / 1000;           
        last_time = block.timestamp;
        players.push(Player(msg.sender,  0 , false));
        number_of_players++;
         
        if(number_of_players == 3){  
            Pay();
        }
    }
}