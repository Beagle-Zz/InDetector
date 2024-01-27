contract c10267{
    //@notice Get complete information about a country token
    function getCountry(uint256 _tokenId) public view returns (
        string ,
        uint256 ,
        address ,
        uint256
    ) {
        Country storage country = countries[_tokenId];
        string memory countryName = country.name;
        uint256 sellingPrice = countryIndexToPrice[_tokenId];
        uint256 rank = countryToRank[_tokenId];
        address owner = countryIndexToOwner[_tokenId];
        return (countryName, sellingPrice, owner, rank);
    }
}