contract c12321{
  /******************************************/
  /*      vault functions start here        */
  /******************************************/
  /**
  * @dev Allows anyone to create a vault access.
  *      Vault deposit is transferred to token contract and sum is stored in totalDeposit
  *      Price must be lower than Vault deposit
  * @param price to pay to access certificate vault
  */
  function createVaultAccess (uint256 price)
      public
      onlyMintingFinished
  {
      require(accessAllowance[msg.sender][msg.sender].clientAgreement==false, "vault already created");
      require(price<=vaultDeposit, "price asked is too high");
      require(balanceOf(msg.sender)>vaultDeposit, "user has not enough tokens to send deposit");
      data[msg.sender].accessPrice=price;
      super.transfer(this, vaultDeposit);
      totalDeposit = totalDeposit.add(vaultDeposit);
      data[msg.sender].userDeposit=vaultDeposit;
      data[msg.sender].sharingPlan=100;
      accessAllowance[msg.sender][msg.sender].clientAgreement=true;
      emit Vault(msg.sender, msg.sender, VaultStatus.Created);
  }
}