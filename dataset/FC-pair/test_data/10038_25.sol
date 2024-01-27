contract c10038{
  /**
   * Child contract can override to provide the condition in which the upgrade can begin.
   */
  function canUpgrade() public view returns(bool) {
     return true;
  }
}