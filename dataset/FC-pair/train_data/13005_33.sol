contract c13005{
  /* Upgrade functions */
  function buySpaceshipUpgrade(uint256 _tokenId, uint16 _model, uint8 _position) public payable onlyOwnerOf(_tokenId) {
    require(msg.value > 0);
    uint256 upgradePrice = upgradeContract.getSpaceshipUpgradePriceByModel(_model, _position);
    require(msg.value == upgradePrice);
    require(getPlayerSpaceshipBattleModeById(_tokenId) == false);
    bytes5 currentUpgrades = spaceships[_tokenId].upgrades;
    upgradeContract.isSpaceshipUpgradeAllowed(currentUpgrades, _model, _position);
    spaceships[_tokenId].upgrades = upgradeContract.buySpaceshipUpgrade(currentUpgrades, _model, _position);
    balances[owner] += upgradePrice;
    emit EventBuySpaceshipUpgrade(msg.sender, _tokenId, _model, _position);
  }
}