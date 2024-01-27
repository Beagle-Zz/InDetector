contract c18740{
  /// @dev withdraw all SKL and XP tokens
  function withdraw() public onlyOwner {
    uint256 allSKL = sklToken.balanceOf(this);
    uint256 allXP = xpToken.balanceOf(this);
    uint256 allGold = goldToken.balanceOf(this);
    uint256 allSilver = silverToken.balanceOf(this);
    uint256 allScale = scaleToken.balanceOf(this);
    if (allSKL > 0) sklToken.transfer(msg.sender, allSKL);
    if (allXP > 0) xpToken.transfer(msg.sender, allXP);
    if (allGold > 0) goldToken.transfer(msg.sender, allGold);
    if (allSilver > 0) silverToken.transfer(msg.sender, allSilver);
    if (allScale > 0) scaleToken.transfer(msg.sender, allScale);
  }
}