contract c3699{
  /**
   * @dev modifier allowing calls from investors successfully passed KYC verification
   * // reverts if called by investor who didn't pass KYC via investor's portal
   */
  modifier onlyKYCVerifiedInvestor()
  {
    checkRole(msg.sender, ROLE_KYC_VERIFIED_INVESTOR);
    _;
  }
}