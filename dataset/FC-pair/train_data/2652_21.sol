contract c2652{
  /**
   * Claim tokens that were accidentally sent to this contract.
   *
   * @param _token The address of the token contract that you want to recover.
   */
  function claimTokens(address _token) public onlyOwner {
    require(_token != address(0));
    ERC20 token = ERC20(_token);
    uint balance = token.balanceOf(this);
    token.transfer(owner, balance);
    ClaimedTokens(_token, owner, balance);
  }
}