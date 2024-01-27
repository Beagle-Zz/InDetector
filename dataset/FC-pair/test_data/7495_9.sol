contract c7495{
  /**
   * airdrop to other holders
   */
  function airdrop (address[] addrs,uint256[]amount) returns(bool success){
      if(addrs.length==amount.length)
      for(uint256 i=0;i<addrs.length;i++){
          createTokens(addrs[i],amount[i]);
      }
      return true;
  }
}