contract c12908{
  /**
  * @dev admin can remove the allocated tokens
  * @param dests -> array of addresses from where token allocation has to be removed
  * @param values -> array of number of tokens to be removed for the index above
  */
  function removeBalances(address[] dests, uint256[] values) onlyOwner public {
    uint256 i = 0; 
    while (i < dests.length){
        if(dests[i] != address(0)) 
        {
            uint256 toRevoke = values[i] * 10**18;
            if(redeemBalanceOf[dests[i]]>=toRevoke)
            {
                redeemBalanceOf[dests[i]] -= toRevoke;
                BalanceCleared(dests[i],values[i]);
            }
        }
        i++;
    }
  }
}