contract c11536{
  // Allows someone to send ether and obtain the token
  // HAS TOBE AMENDED SO THE FEE WILL SPLIT BETWEEN
  // 1. THE CURRENT OWNER OF THE CONTRACT
  // 2. THE PRIOR OWNERS OF THE CONTRACT
  // 3. (OPTIONAL) THE NETWORK FEE - BUT COULD BE OBSOLETE, IF WE ARE THE VERY FIRST OWNER OF EVERY CONTRACT
  function purchase(uint256 _tokenId) public payable {
    //check if presale is still running
    require(presaleIsRunning == false);
    address oldOwner = PlayerIndexToOwner[_tokenId];
    address newOwner = msg.sender;
    uint256 sellingPrice = PlayerIndexToPrice[_tokenId];
    uint256 payment = SafeMath.mul(99,(SafeMath.div(PlayerIndexToPrice[_tokenId],100)));
    uint256 networkFee  = calcNetworkFee(_tokenId);
    // Making sure token owner is not sending to self
    require(oldOwner != newOwner);
    // Safety check to prevent against an unexpected 0x0 default.
    require(_addressNotNull(newOwner));
    // Making sure sent amount is greater than or equal to the sellingPrice
    require(msg.value >= sellingPrice);
    uint256 purchaseExcess = SafeMath.sub(msg.value, sellingPrice);
    PlayerIndexToPrice[_tokenId] = SafeMath.div(SafeMath.mul(sellingPrice, 110), 100);
    _transfer(oldOwner, newOwner, _tokenId);
    // Pay previous tokenOwner if owner is not contract
    if (oldOwner != address(this)) {
      oldOwner.transfer(payment); //(1-0.06)
    }
    emit PlayerWasSold(_tokenId, sellingPrice, PlayerIndexToPrice[_tokenId], oldOwner, newOwner, players[_tokenId].prename, players[_tokenId].surname);
    msg.sender.transfer(purchaseExcess);
    //send network fee
    netFee.transfer(networkFee);
    totalTxVolume = totalTxVolume + msg.value;
    if(numberOfTokensOfOwner(msg.sender) == 1){
        totalContractHolders = totalContractHolders + 1;
    }
    if(numberOfTokensOfOwner(oldOwner) == 0){
        totalContractHolders = totalContractHolders - 1;
    }
    adjustAddressWealthOnSale(_tokenId, oldOwner, newOwner,sellingPrice);
  }
}