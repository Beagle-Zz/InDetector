contract c12323{
  /**
  * @dev Closes a vault access, deposit is sent back to freelance wallet
  *      Total deposit in token contract is reduced by user deposit
  */
  function closeVaultAccess()
      public
      onlyMintingFinished
  {
      require(accessAllowance[msg.sender][msg.sender].clientAgreement==true, "vault has not been created");
      require(_transfer(this, msg.sender, data[msg.sender].userDeposit), "token deposit transfer failed");
      accessAllowance[msg.sender][msg.sender].clientAgreement=false;
      totalDeposit=totalDeposit.sub(data[msg.sender].userDeposit);
      data[msg.sender].sharingPlan=0;
      emit Vault(msg.sender, msg.sender, VaultStatus.Closed);
  }
}