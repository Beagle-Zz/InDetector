contract c2730{
  /// For creating Crypton
  function _createCrypton(string _name, address _owner, uint256 _price, uint256 _markup, bool _isProtected, uint8 _category) private {
    Crypton memory _crypton = Crypton({
      name: _name,
      category: _category,
      markup: _markup
    });
    uint256 newCryptonId = cryptons.push(_crypton) - 1;
    // It's probably never going to happen, 4 billion tokens are A LOT, but
    // let's just be 100% sure we never let this happen.
    require(newCryptonId == uint256(uint32(newCryptonId)));
    emit Birth(newCryptonId, _name, _owner, _isProtected, _category);
    cryptonIndexToPrice[newCryptonId] = _price;
    cryptonIndexToProtected[newCryptonId] = _isProtected; // _isProtected is true for promo cryptons - false for others.
    // This will assign ownership, and also emit the Transfer event as
    // per ERC721 draft
    _transfer(address(0), _owner, newCryptonId);
  }
}