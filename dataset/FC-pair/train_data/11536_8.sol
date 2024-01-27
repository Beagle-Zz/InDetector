contract c11536{
  // ********************************************************************************************************
  // PURCHASE FUNCTIONS
  // ********************************************************************************************************
  // @dev Purchase related stuff
  // ********************************************************************************************************
  function adjustAddressWealthOnSale(uint256 _tokenId, address _oldOwner, address _newOwner,uint256 _sellingPrice) private {
        uint256 currentOldOwnerWealth = addressWealth[_oldOwner];
        uint256 currentNewOwnerWealth = addressWealth[_newOwner];
        addressWealth[_oldOwner] = currentOldOwnerWealth - _sellingPrice;
        addressWealth[_newOwner] = currentNewOwnerWealth + PlayerIndexToPrice[_tokenId];
    }
}