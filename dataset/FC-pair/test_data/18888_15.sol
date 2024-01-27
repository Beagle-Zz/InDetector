contract c18888{
  /**
   * @notice Allows the owner to revoke the vesting. Tokens already vested are sent to the beneficiary.
   */
  function revoke() onlyOwner public {
    require(revocable);
    require(!revoked);
    // Release all vested tokens
    _releaseTo(beneficiary);
    // Send the remainder to the owner
    token.safeTransfer(owner, token.balanceOf(this));
    revoked = true;
    Revoked();
  }
}