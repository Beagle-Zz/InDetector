contract c40464{
     
    modifier checkWaitingForBet(){
         
        if (playerStatus[msg.sender]!=Status.waitingForBet)
        {
              
             if (gambles[gambleIndex[msg.sender]].blockNumber+blockExpiration>block.number) throw;
              
             else
             {
                   
                  solveBet(msg.sender, 255, false, 0) ;
              }
        }
	_;
	}
}