contract c12395{
  /**
  * @dev Calculate vested claimable tokens on current time
  * @param _tokens Number of tokens granted
  * @param _vesting Vesting finish timestamp
  * @param _start Vesting start timestamp
  * @param _claimed Number of tokens already claimed
  */
  function calculateVestedTokens(
      uint256 _tokens,
      uint256 _vesting,
      uint256 _start,
      uint256 _claimed
  ) internal constant returns (uint256) {
    uint256 time = block.timestamp;
    if (time < _start) {
      return 0;
    }
    if (time >= _vesting) {
      return _tokens.sub(_claimed);
    }
    uint256 vestedTokens = _tokens.mul(time.sub(_start)).div(
      _vesting.sub(_start)
    );
    return vestedTokens.sub(_claimed);
  }
}