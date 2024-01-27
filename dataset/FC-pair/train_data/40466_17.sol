contract c40466{
      
     
     
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