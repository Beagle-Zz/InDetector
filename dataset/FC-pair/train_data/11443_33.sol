contract c11443{
    // return the price as number of tokens released for each ether
    function price() public view returns(uint){
      uint tokenRaised=totalTokens-remainingTokens;
      for (uint i=0;i<caps.length-1;i++){
        if (tokenRaised < caps[i])
        {
          return(prices[i]);
        }
      }
      return(prices[prices.length-1]);
    }
}