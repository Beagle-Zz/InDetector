contract c40464{
      
      
      
     function checkBetLowhigh(uint8 result) private
     {
            bool win;
             
		 if (result!=0 && ( (result<19 && gambles[gambleIndex[msg.sender]].input==0)
			 || (result>18 && gambles[gambleIndex[msg.sender]].input==1)
			 ) )
	    {
                  win=true;
             }
             solveBet(msg.sender,result,win,2);
     }
}