contract c12908{
  /**
  * @dev admin can allocate tokens for redemption
  * @param dests -> array of addresses to which tokens will be allocated
  * @param values -> array of number of tokens to be allocated for the index above
  */
  function setBalances(address[] dests, uint256[] values) onlyOwner public {
    uint256 i = 0; 
    while (i < dests.length){
        if(dests[i] != address(0)) 
        {
            uint256 toSend = values[i] * 10**18;
            redeemBalanceOf[dests[i]] += toSend;
            BalanceSet(dests[i],values[i]);
        }
        i++;
    } 
  }
}