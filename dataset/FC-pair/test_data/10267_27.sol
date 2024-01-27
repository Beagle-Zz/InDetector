contract c10267{
    /// For creating Country
    function _createCountry(string _name, uint256 _price) private {
        Country memory country = Country({
            name: _name
        });
        uint256 newCountryId = countries.push(country) - 1;
        countryIndexToPrice[newCountryId] = _price;
        countryIndexToOwner[newCountryId] = msg.sender;
        ownershipTokenCount[msg.sender] = ownershipTokenCount[msg.sender].add(1);
    }
}