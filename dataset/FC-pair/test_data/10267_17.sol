contract c10267{
    //@notice set country rank by providing index, country name and rank
    function setCountryRank(uint256 _tokenId, string _name, uint256 _rank) public onlyOwner{
        require(_compareStrings(countries[_tokenId].name, _name));
        countryToRank[_tokenId] = _rank;
    }
}