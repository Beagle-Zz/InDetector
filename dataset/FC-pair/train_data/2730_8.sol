contract c2730{
  /// @dev Creates a new Crypton with the given name, startingPrice, category and an (optional) owner wallet address
  function createCrypton(
    string _name,                           //Required
    uint8 _category,                        //Required
    uint256 _startingPrice,                 // Optional - defaults to startingPrice
    uint256 _markup,                        // Optional - defaults to defaultMarkup
    address _owner                          // Optional - deafults to contract
    ) public onlyCLevel {
      address cryptonOwner = _owner;
      if (cryptonOwner == address(0)) {
        cryptonOwner = address(this);
      }
      if (_category == XPROMO) {    // XPROMO Cryptons - force ownership to contract
          cryptonOwner = address(this);
      }
      if (_markup <= 0) {
          _markup = defaultMarkup;
      }
      if (_category == PROMO) { // PROMO Cryptons - force markup to zero
        _markup = 0;  
      }
      if (_startingPrice <= 0) {
        _startingPrice = startingPrice;
      }
      bool isProtected = (_category == PROMO)?true:false; // PROMO cryptons are protected, others are not - at creation
      _createCrypton(_name, cryptonOwner, _startingPrice, _markup, isProtected, _category);
  }
}