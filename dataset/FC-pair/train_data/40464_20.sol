contract c40464{
      
      
      
     function checkBetDozen(uint8 result) private
     { 
            bool win;
             
     		 if ( result!=0 &&
                      ( (result<13 && gambles[gambleIndex[msg.sender]].input==0)
     			||
                     (result>12 && result<25 && gambles[gambleIndex[msg.sender]].input==1)
                    ||
                     (result>24 && gambles[gambleIndex[msg.sender]].input==2) ) )
     	    {
                   win=true;                
             }
             solveBet(msg.sender,result,win,3);
     }
}