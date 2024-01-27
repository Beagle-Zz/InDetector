contract c10040{
  /**
   * Allow upgrade agent functionality to kick in only if the crowdsale was a success.
   */
  function canUpgrade() public view returns(bool) {
    return released && super.canUpgrade();
  }
}