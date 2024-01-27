contract c640{
  /**
   * @dev Mark investor's address as KYC-verified person
   * @param addr address
   */
  function addKycVerifiedInvestor(address addr)
    public
    onlyBackend
  {
    addRole(addr, ROLE_KYC_VERIFIED_INVESTOR);
  }
}