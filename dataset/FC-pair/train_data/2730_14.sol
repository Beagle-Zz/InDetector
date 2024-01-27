contract c2730{
  /// @dev This function allows the contract owner to buy protection for an unprotected that they already own
  function setProtectionForMyUnprotectedCrypton(uint256 _tokenId, uint256 newSellingPrice) public payable whenNotPaused {
    address oldOwner = cryptonIndexToOwner[_tokenId]; // owner in blockchain
    address newOwner = msg.sender;                    // person requesting change
    uint256 markup = cryptons[_tokenId].markup;
    if (cryptons[_tokenId].category != PROMO) {
      require(markup > 0); // if this is NOT a promotional crypton, the markup should be > zero
    }
    require(oldOwner == newOwner); // Only current owner can buy protection for existing crypton
    require(! cryptonIndexToProtected[_tokenId]); // Make sure Crypton is NOT already protected
    require(newSellingPrice > 0);  // Make sure the sellingPrice is more than zero
    require(msg.value >= markup);   // Make sure to collect the markup
    cryptonIndexToPrice[_tokenId] = newSellingPrice;
    cryptonIndexToProtected[_tokenId] = true;
    emit OwnerProtectedCrypton(_tokenId, newSellingPrice);
 }
}