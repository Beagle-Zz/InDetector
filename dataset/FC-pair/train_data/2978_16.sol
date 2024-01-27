contract c2978{
  /**
  * Returns the total Led token supply at the given block number
  * @param _blockNumber {uint256}
  * @return total supply {uint256}
  */
  function totalSupplyAt(uint256 _blockNumber) public constant returns(uint256) {
    // These next few lines are used when the totalSupply of the token is
    //  requested before a check point was ever created for this token, it
    //  requires that the `parentToken.totalSupplyAt` be queried at the
    //  genesis block for this token as that contains totalSupply of this
    //  token at this block number.
    if ((totalSupplyHistory.length == 0) || (totalSupplyHistory[0].fromBlock > _blockNumber)) {
        if (address(parentToken) != 0x0) {
            return parentToken.totalSupplyAt(min(_blockNumber, parentSnapShotBlock));
        } else {
            return 0;
        }
    // This will return the expected totalSupply during normal situations
    } else {
        return getValueAt(totalSupplyHistory, _blockNumber);
    }
  }
}