contract c8643{
  /**
   * Get number of tokens currently belonging to given owner.
   *
   * @param _owner address to get number of tokens currently belonging to the
   *        owner of
   * @return number of tokens currently belonging to the owner of given address
   */
  function balanceOf (address _owner)
    public delegatable view returns (uint256 balance) {
    return AbstractToken.balanceOf (_owner);
  }
}