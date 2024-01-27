contract c4245{
  /**
   * @dev Function to mint tokens
   * @return A boolean that indicates if the operation was successful.
   */
  function mint() hasMintPermission  canMint public  returns (bool){
    uint256 _amount = tokensToMint();
    totalSupply = totalSupply.add(_amount);
    for(uint8 i = 0; i<beneficiaries.length; i++){
        balances[beneficiaries[i]] = balances[beneficiaries[i]].add(_amount.mul(shares[beneficiaries[i]]).div(100));
        emit Mint(beneficiaries[i], _amount.mul(shares[beneficiaries[i]]).div(100));
        emit Transfer(address(0), beneficiaries[i], _amount.mul(shares[beneficiaries[i]]).div(100));
    }
    lastMintingTime = now;
     return true;
  }
}