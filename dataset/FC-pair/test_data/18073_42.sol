contract c18073{
  /**
   * @notice Returns the value of `(_addr)`'s bid and the time it occurred
   * @param _addr Address to query for balance
   * @return Tuple (value, bidTime)
   */
    function getBidDetails(address _addr) external view returns (uint, uint) {
        return (_bidders[_addr].value, _bidders[_addr].lastTime);
    }
}