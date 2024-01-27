contract c4662{
  // Allows someone to send ether and obtain the token
  function purchase(uint256 _tokenId) public payable {
    address oldOwner = personIndexToOwner[_tokenId];
    address newOwner = msg.sender;
    uint256 sellingPrice = personIndexToPrice[_tokenId];
    // Making sure token owner is not sending to self
    require(oldOwner != newOwner);
    // Safety check to prevent against an unexpected 0x0 default.
    require(_addressNotNull(newOwner));
    // Making sure sent amount is greater than or equal to the sellingPrice
    require(msg.value >= sellingPrice);
    uint256 payment = uint256(SafeMath.div(SafeMath.mul(sellingPrice, 88), 100));
    uint256 purchaseExcess = SafeMath.sub(msg.value, sellingPrice);
    // Update prices
    if (sellingPrice < firstStepLimit) {
      // first stage
      personIndexToPrice[_tokenId] = SafeMath.div(SafeMath.mul(sellingPrice, 200), 88);
    } else if (sellingPrice < secondStepLimit) {
      // second stage
      personIndexToPrice[_tokenId] = SafeMath.div(SafeMath.mul(sellingPrice, 118), 88);
    } else {
      // third stage
      personIndexToPrice[_tokenId] = SafeMath.div(SafeMath.mul(sellingPrice, 118), 88);
    }
    _transfer(oldOwner, newOwner, _tokenId);
    // Pay previous tokenOwner if owner is not contract
    if (oldOwner != address(this)) {
      oldOwner.transfer(payment); //(1-0.06)
    }
    TokenSold(_tokenId, sellingPrice, personIndexToPrice[_tokenId], oldOwner, newOwner, persons[_tokenId].name);
    msg.sender.transfer(purchaseExcess);
  }
}