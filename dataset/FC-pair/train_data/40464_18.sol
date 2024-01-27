contract c40464{
      
     
     
     function checkBetParity(uint8 result) private
     {
            bool win;
             
	    if (result%2==gambles[gambleIndex[msg.sender]].input && result!=0)
	    {
                  win=true;                
             }
             solveBet(msg.sender,result,win,2);
     }
}