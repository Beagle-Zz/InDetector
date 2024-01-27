contract c13992{
  /*Gets the unlocked time of the specified address. */
  function getLockTime(address _owner) public view returns(uint256){
    // start + ( lockCycle * duration )
    return _lockInfo[_owner].start.add(
        _lockInfo[_owner].releaseCount.mul(_lockInfo[_owner].duration));
  }
}