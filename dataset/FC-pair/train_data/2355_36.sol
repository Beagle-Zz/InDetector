contract c2355{
  /**
    * @dev perform a transfer of allocations
    * @param _recipient is a list of recipients
    */
  function airdropTokens(address[] _recipient) public onlyOwnerOrAdmin {
    uint airdropped;
    for(uint256 i = 0; i< _recipient.length; i++)
    {
        if (!airdrops[_recipient[i]]) {
          airdrops[_recipient[i]] = true;
          Ubricoin.transfer(_recipient[i], 1 * decimals);
          airdropped = airdropped.add(1 * decimals);
        }
    }
    AVAILABLE_AIRDROP_SUPPLY = AVAILABLE_AIRDROP_SUPPLY.sub(airdropped);
    totalSupply = totalSupply.sub(airdropped);
    grandTotalClaimed = grandTotalClaimed.add(airdropped);
}
}