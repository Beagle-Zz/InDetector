contract c8101{
  /**
   * @notice Allows the owner to revoke the vesting. Tokens already vested
   * remain in the contract, the rest are returned to the owner.
   * @param token ERC20MiniMe token which is being vested
   */
  function revoke(ERC20MiniMe token) public onlyOwner {
    require(revocable);
    require(!revoked[token]);
    uint256 balance = token.balanceOf(this);
    uint256 unreleased = releasableAmount(token);
    uint256 refund = balance.sub(unreleased);
    revoked[token] = true;
    require(token.transfer(owner, refund));
    Revoked();
  }
}