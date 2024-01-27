contract c2276{
    // @dev deposit unpacks _extraData and log listing info
    // @param _extraData packed bytes of (uint _price, uint _currency)
    function _deposit(address _seller, address _contract, uint _tokenId, bytes _extraData) internal onlyWhitelisted(_contract) {
        uint price;
        uint currencyUint;
        (currencyUint, price) = _decodePriceData(_extraData);
        Currency currency = Currency(currencyUint);
        require(price > 0, "Invalid price.");
        _newListing(_seller, _contract, _tokenId, price, currency);
    }
}