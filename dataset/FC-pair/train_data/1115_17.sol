contract c1115{
  /**
   * @notice Allows the owner to revoke the vesting. Tokens already vested
   * remain in the contract, the rest are returned to the owner.
   * @param _token ERC20 token which is being vested
   */
  function revoke(ERC20 _token) public onlyOwner {
    require(revocable);
    require(!revoked[_token]);
    uint256 balance = _token.balanceOf(address(this));
    uint256 unreleased = releasableAmount(_token);
    uint256 refund = balance.sub(unreleased);
    revoked[_token] = true;
    _token.safeTransfer(owner, refund);
    emit Revoked();
  }
}