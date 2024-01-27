contract c18073{
  /**
   * @notice Get whether the auction has ended
   * @return Whether the auction has ended
   */
    function getEnded() external view returns (bool) {
        return _ended;
    }
}