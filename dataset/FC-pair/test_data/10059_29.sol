contract c10059{
      /**
       * Set the tokens bought
       **/ 
      function setTokensBought(uint tokensBought) public onlyOwner 
      {
          TOKENS_BOUGHT = tokensBought;
      }
}