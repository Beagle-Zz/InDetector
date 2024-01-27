contract c13496{
  /**
   * Child contract can enable to provide the condition when the upgrade can begin.
   */
  function canUpgrade() public constant returns(bool) {
     return true;
  }
}