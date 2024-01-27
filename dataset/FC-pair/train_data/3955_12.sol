contract c3955{
  /**
   * @dev Used to specify the time period during which a pending
   * owner can claim ownership.
   * @param _start The earliest time ownership can be claimed.
   * @param _end The latest time ownership can be claimed.
   */
  function setLimits(uint256 _start, uint256 _end) onlyOwner public {
    require(_start <= _end);
    end = _end;
    start = _start;
  }
}