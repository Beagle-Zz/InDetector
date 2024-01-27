contract c11536{
  // ********************************************************************************************************
  // ONLYCEO FUNCTIONS
  // ********************************************************************************************************
  // @dev All functions that are only executable by the owner of the contract
  // PLAYER CREATIN RELATED
  // ********************************************************************************************************
  function createPlayer(uint256 _id, uint256 _countryId, string _country, string _prename, string _middlename, string _surname, string _pictureUrl, string _flagUrl, address _owner, uint256 _price) public onlyCEO onlyDuringPresale{
    uint256 newPrice = SafeMath.mul(_price, myFinneyValue);
    Player memory _player = Player({
     id: _id,
     countryId: _countryId,
     country: _country,
     surname: _surname,
     middlename: _middlename,
     prename: _prename,
     price: newPrice,
     pictureUrl: _pictureUrl,
     flagUrl: _flagUrl,
     position: "",
     age: 0,
     offensive: 0,
     defensive: 0,
     totalRating: 0
    });
    uint256 newPlayerId = players.push(_player) - 1;
    // It's probably never going to happen, 4 billion tokens are A LOT, but
    // let's just be 100% sure we never let this happen.
    require(newPlayerId == uint256(uint32(newPlayerId)));
    emit NewPlayerCreated(newPlayerId, newPlayerId, _prename, _surname, _owner, _price);
    addMappingForPlayerIDs (newPlayerId, _id, _countryId );
    PlayerIndexToPrice[newPlayerId] = newPrice;
    PlayerInternalIndexToGlobalIndex[newPlayerId] = newPlayerId;
    currentwealth =   addressWealth[_owner];
    addressWealth[_owner] = currentwealth + newPrice;
    totalTxVolume = totalTxVolume + newPrice;
    // This will assign ownership, and also emit the Transfer event as
    // per ERC721 draft
    _transfer(address(0), _owner, newPlayerId);
    totalContractsAvailable = totalContractsAvailable;
    if(numberOfTokensOfOwner(_owner) == 0 || numberOfTokensOfOwner(_owner) == 1){
        totalContractHolders = totalContractHolders + 1;
    }
  }
}