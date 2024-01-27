contract c10226{
  /**
   * @dev Decrease the amount of tokens that an owner allowed to a spender.
   *
   * Issuer can only issue tokens up to the lesser of assetsOnDeposit and
   * assetsCertified.  This prevents issuing uncertified tokens and ensures
   * that every token issued has exactly one unit of the asset backing it.
   * @param _units Total amount of additional tokens to issue
   */
  function issueTokensForAssets( uint256 _units ) public onlyIssuer {
    uint256 newSupply_ = totalSupply().add(_units);
    // Find the greater of assetsOnDeposit and assetsCertified
    uint256 limit_ = 0;
    if ( assetsOnDeposit() > assetsCertified() )
      limit_ = assetsOnDeposit();
    else
      limit_ = assetsCertified();
    // the new supply can't be larger than our issuance limit
    require( newSupply_ <= limit_ );
    // Increase the total supply
    increaseTotalSupply( _units );
    // Increase the issuer's balance
    setBalanceOf(issuer(), balanceOf(issuer()).add(_units));
    emit TokensIssued(issuer(), _units);
  }
}