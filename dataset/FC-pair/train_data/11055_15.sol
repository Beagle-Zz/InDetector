contract c11055{
  // Buy function
  function buy (uint256 _itemId, uint256 _charityCutNew) payable public {
    require(priceOf(_itemId) > 0); // price of the token has to be greater than zero
    require(_charityCutNew >= 10); // minimum charity cut is 10%
    require(_charityCutNew <= 100); // maximum charity cut is 100%
    require(charityCutOf(_itemId) >= 10); // minimum charity cut is 10%
    require(charityCutOf(_itemId) <= 100); // maximum charity cut is 100%
    require(ownerOf(_itemId) != address(0)); // owner is not 0x0
    require(msg.value >= priceOf(_itemId)); // msg.value has to be greater than the price of the token
    require(ownerOf(_itemId) != msg.sender); // the owner cannot buy her own token
    require(!isContract(msg.sender)); // message sender is not a contract
    require(msg.sender != address(0)); // message sender is not 0x0
    address oldOwner = ownerOf(_itemId); // old owner of the token
    address newOwner = msg.sender; // new owner of the token
    uint256 price = priceOf(_itemId); // price of the token
    uint256 previousPrice = previousPriceOf(_itemId); // previous price of the token (oldOwner bought it for this price)
    uint256 charityCut = charityCutOf(_itemId); // actual charity cut of the token (oldOwner set this value)
    uint256 excess = msg.value.sub(price); // excess
    charityCutOfItem[_itemId] = _charityCutNew; // update the charity cut array
    previousPriceOfItem[_itemId] = priceOf(_itemId); // update the previous price array
    priceOfItem[_itemId] = nextPriceOf(_itemId); // update price of item
    _transfer(oldOwner, newOwner, _itemId); // transfer token from oldOwner to newOwner
    emit Bought(_itemId, newOwner, price); // bought event
    emit Sold(_itemId, oldOwner, price); // sold event
    // Devevloper's cut which is left in contract and accesed by
    // `withdrawAll` and `withdrawAmountTo` methods.
    uint256 devCut = calculateDevCut(price); // calculate dev cut
    // Charity contribution
    uint256 charityAmount = ((price.sub(devCut)).sub(previousPrice)).mul(charityCut).div(100); // calculate the charity cut
    charityAddress.transfer(charityAmount); // transfer payment to the address of the charity
    oldOwner.transfer((price.sub(devCut)).sub(charityAmount)); // transfer payment to old owner minus the dev cut and the charity cut
    if (excess > 0) {
      newOwner.transfer(excess); // transfer the excess
    }
  }
}