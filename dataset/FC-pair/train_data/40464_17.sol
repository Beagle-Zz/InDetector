contract c40464{
      
     
     
     function checkBetNumber(uint8 result) private
     {
            bool win;
             
	    if (result==gambles[gambleIndex[msg.sender]].input)
	    {
                  win=true;  
             }
             solveBet(msg.sender, result,win,35);
     }
}