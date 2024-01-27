contract c40005{
     
     
    function _api_PlaceBet (bool modeA) payable{
     
         
         
         
         
         
         
         
        if (msg.value < GetMinimumBet() || msg.value > GetMaximumBet() ) throw; 
         
        uint256 cntBlockUsed = blockUsed[block.number];  
        if (cntBlockUsed > maxGamesPerBlock) throw; 
        blockUsed[block.number] = cntBlockUsed + 1; 
        gamesPlayed++;             
        lastPlayer = msg.sender;   
         
         
        uint winnerOdds = 3;   
        uint totalPartition  = 5;  
        if (alreadyPlayed[msg.sender]){   
            winnerOdds = 2; 
        }
        alreadyPlayed[msg.sender] = true;  
         
        winnerOdds = winnerOdds * 20;   
        totalPartition = totalPartition * 20;     
         
         
        uint256 random = createRandomNumber(totalPartition);  
        bool winner = true;
         
        if (modeA){   
            if (random > winnerOdds ) winner = false;
        }
        else {    
            if (random < (100 - winnerOdds) ) winner = false;
        }
         
        if (winner){
            if (!msg.sender.send(msg.value * 2))  
                throw;  
        }
         
    }
}