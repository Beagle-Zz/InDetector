contract c18365{
  /**
   * @dev Close crowdsale, only for owner.
   */
  function closeCrowdsale() onlyOwner public {
    require(!isClosed);
    isClosed = true;
    uint256 tokenBalance = token.balanceOf(address(this));
    if (tokenBalance > 0) {
      token.transfer(owner, tokenBalance);
    }
    Closed();
  }
}