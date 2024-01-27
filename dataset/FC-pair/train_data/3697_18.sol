contract c3697{
  /**
   * @dev Called when investor's portal (backend) receives non-ethereum payment
   * @param _investor address of investor
   * @param _cents received deposit amount in cents
   */
  function buyTokensViaBackend(address _investor, uint256 _cents)
    public
    onlyBackend
  {
    if (! RBAC.hasRole(_investor, ROLE_KYC_VERIFIED_INVESTOR)) {
      addKycVerifiedInvestor(_investor);
    }
    buyTokens(_investor, _cents);
  }
}