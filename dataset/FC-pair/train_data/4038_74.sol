contract c4038{
  // @dev Set where the heroes are deployed, and when they will return.
  //  This is intended to be called by Dungeon, Arena, Guild contracts.
  function deploy(uint256 _tokenId, uint32 _locationId, uint256 _duration)
    onlyAccessDeploy
    public
    returns (bool)
  {
    // The hero should be possessed by anybody.
    require(ownerOf(_tokenId) != address(0));
    var _heroInstance = tokenIdToHeroInstance[_tokenId];
    // The character should be avaiable. 
    require(_heroInstance.availableAt <= now);
    _heroInstance.lastLocationId = _locationId;
    _heroInstance.availableAt = now + _duration;
    // As the hero has been deployed to another place, fire event.
    Deploy(msg.sender, _tokenId, _locationId, _duration);
  }
}