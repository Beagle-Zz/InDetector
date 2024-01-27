contract c18661{
  // @dev Give rewards.
  function giveReward(uint256[4] _heroes, uint32 _progress, uint8 _numberOfKilledEnemies, bool _isClearedBefore, uint32[4] _originalExps)
    private
    returns (uint32 expRewardGiven, uint256 goldRewardGiven)
  {
    uint256 _goldRewardGiven;
    uint32 _expRewardGiven;
    if (_numberOfKilledEnemies != 4) {
      // In case lost.
      // Give baseline gold reward.
      _goldRewardGiven = goldReward / 25 * sqrt(_progress);
      _expRewardGiven = expReward * _numberOfKilledEnemies / 4 / 5;
    } else if (_isClearedBefore == true) {
      // Did win, but this progress has been already cleared before.
      _goldRewardGiven = goldReward / 5 * sqrt(_progress);
      _expRewardGiven = expReward / 5;
    } else {
      // Firstly cleared the progress.
      _goldRewardGiven = goldReward * sqrt(_progress);
      _expRewardGiven = expReward;
    }
    // Give reward Gold.
    goldContract.mint(msg.sender, _goldRewardGiven);
    // Give reward EXP.
    if(_heroes[0] != 0)
      heroContract.addExp(_heroes[0], uint32(2)**32 - _originalExps[0] + _expRewardGiven);
    if(_heroes[1] != 0)
      heroContract.addExp(_heroes[1], uint32(2)**32 - _originalExps[1] + _expRewardGiven);
    if(_heroes[2] != 0)
      heroContract.addExp(_heroes[2], uint32(2)**32 - _originalExps[2] + _expRewardGiven);
    if(_heroes[3] != 0)
      heroContract.addExp(_heroes[3], uint32(2)**32 - _originalExps[3] + _expRewardGiven);
    return (_expRewardGiven, _goldRewardGiven);
  }
}