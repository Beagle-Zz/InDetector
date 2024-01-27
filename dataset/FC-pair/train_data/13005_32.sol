contract c13005{
  /* Battle functions */
  function battleAdd(uint256 _tokenId) public payable onlyOwnerOf(_tokenId) {
    require(msg.value == getPlayerSpaceshipBattleStakeById(_tokenId));
    require(msg.value > 0);
    require(spaceships[_tokenId].battleMode == false);
    spaceships[_tokenId].battleMode = true;
    spaceships[_tokenId].battleStake = msg.value;
    emit EventBattleAdd(msg.sender, _tokenId);
  }
}