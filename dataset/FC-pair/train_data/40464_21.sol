contract c40464{
      
      
      
      function checkBetColumn(uint8 result) private
      {
             bool win;
              
             if ( result!=0
                && ( (gambles[gambleIndex[msg.sender]].input==0 && result%3==1)  
                || ( gambles[gambleIndex[msg.sender]].input==1 && result%3==2)
                || ( gambles[gambleIndex[msg.sender]].input==2 && result%3==0)  ) )
             {
                  win=true;
             }
             solveBet(msg.sender,result,win,3);
      }
}