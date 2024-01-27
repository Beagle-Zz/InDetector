contract c10059{
      /**
       * Returns the number of tokens who have been sold  
       **/ 
      function getTokensBought() public constant returns(uint) 
      {
          return TOKENS_BOUGHT;
      }
}