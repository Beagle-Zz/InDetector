contract c4016{
  // @dev Give rewards.
  function giveReward(uint256[4] _heroes, bool _didWin, uint32[4] _originalExps)
    private
    returns (uint32 expRewardGiven, uint256 goldRewardGiven)
  {
    if (!_didWin) {
      // In case lost.
      // Give baseline gold reward.
      goldRewardGiven = goldReward / 10;
      expRewardGiven = expReward / 5;
    } else {
      // In case win.
      goldRewardGiven = goldReward;
      expRewardGiven = expReward;
    }
    // Give reward Gold.
    goldContract.mint(msg.sender, goldRewardGiven);
    // Give reward EXP.
    if(_heroes[0] != 0)
      heroContract.addExp(_heroes[0], uint32(2)**32 - _originalExps[0] + expRewardGiven);
    if(_heroes[1] != 0)
      heroContract.addExp(_heroes[1], uint32(2)**32 - _originalExps[1] + expRewardGiven);
    if(_heroes[2] != 0)
      heroContract.addExp(_heroes[2], uint32(2)**32 - _originalExps[2] + expRewardGiven);
    if(_heroes[3] != 0)
      heroContract.addExp(_heroes[3], uint32(2)**32 - _originalExps[3] + expRewardGiven);
  }
}