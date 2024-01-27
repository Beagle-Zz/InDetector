contract c2730{
  /// @dev This function allows the contract owner to adjust the selling price of a protected Crypton
  function setPriceForProtectedCrypton(uint256 _tokenId, uint256 newSellingPrice) public whenNotPaused {
    address oldOwner = cryptonIndexToOwner[_tokenId]; // owner in blockchain
    address newOwner = msg.sender;                    // person requesting change
    require(oldOwner == newOwner); // Only current owner can update the price
    require(cryptonIndexToProtected[_tokenId]); // Make sure Crypton is protected
    require(newSellingPrice > 0);  // Make sure the price is not zero
    cryptonIndexToPrice[_tokenId] = newSellingPrice;
    emit ProtectedCryptonSellingPriceChanged(_tokenId, newSellingPrice);
 }
}