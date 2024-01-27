contract c11443{
    // get the next cap as a function of the amount of sold token
    function getCap() public view returns(uint){
      uint tokenRaised=totalTokens-remainingTokens;
      for (uint i=0;i<caps.length-1;i++){
        if (tokenRaised < caps[i])
        {
          // allow for a an overshoot (only when bonus is applied)
          uint tokenPerOvershoot = overshoot * prices[i];
          return(caps[i].add(tokenPerOvershoot));
        }
      }
      // but not on the total amount of tokens
      return(totalTokens);
    }
}