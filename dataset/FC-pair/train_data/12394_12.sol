contract c12394{
  /**
   * @dev Take snapshot
   * @param _owner address The address to take snapshot from
   */
  function takeSnapshot(address _owner) public returns(uint256) {
    if (snapshots[_owner].block < snapshotBlock) {
      snapshots[_owner].block = snapshotBlock;
      snapshots[_owner].balance = balanceOf(_owner);
    }
    return snapshots[_owner].balance;
  }
}