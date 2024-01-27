contract c4016{
  // @dev Check ownership.
  function checkOwnershipAndAvailability(address _playerAddress, uint256[4] _tokenIds)
    private view
    returns(bool)
  {
    if ((_tokenIds[0] == 0 || heroContract.ownerOf(_tokenIds[0]) == _playerAddress) && (_tokenIds[1] == 0 || heroContract.ownerOf(_tokenIds[1]) == _playerAddress) && (_tokenIds[2] == 0 || heroContract.ownerOf(_tokenIds[2]) == _playerAddress) && (_tokenIds[3] == 0 || heroContract.ownerOf(_tokenIds[3]) == _playerAddress)) {
      // Retrieve avail time of heroes.
      uint256[4] memory _heroAvailAts;
      if (_tokenIds[0] != 0)
        ( , , , , , _heroAvailAts[0], , , ) = heroContract.getHeroInfo(_tokenIds[0]);
      if (_tokenIds[1] != 0)
        ( , , , , , _heroAvailAts[1], , , ) = heroContract.getHeroInfo(_tokenIds[1]);
      if (_tokenIds[2] != 0)
        ( , , , , , _heroAvailAts[2], , , ) = heroContract.getHeroInfo(_tokenIds[2]);
      if (_tokenIds[3] != 0)
        ( , , , , , _heroAvailAts[3], , , ) = heroContract.getHeroInfo(_tokenIds[3]);
      if (_heroAvailAts[0] <= now && _heroAvailAts[1] <= now && _heroAvailAts[2] <= now && _heroAvailAts[3] <= now) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}