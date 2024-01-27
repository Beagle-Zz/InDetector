contract c18659{
  // @dev Get corrected total BP of the address.
  function getCorrectedTotalBPOfTokens(uint256[] _tokens)
    external view
    returns (uint32)
  {
    uint32 _totalBP = 0;
    for (uint256 i = 0; i < _tokens.length; i ++) {
      var (, , _currentLevel, , , , _currentStats, _ivs, ) = heroContract.getHeroInfo(_tokens[i]);
      if (_currentLevel != 1) {
        for (uint8 j = 0; j < 5; j ++) {
          _currentStats[j] += _ivs[j];
        }
      }
      _totalBP += (_currentStats[0] + _currentStats[1] + _currentStats[2] + _currentStats[3] + _currentStats[4]);
    }
    return _totalBP;
  }
}