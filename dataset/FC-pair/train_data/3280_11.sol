contract c3280{
    // removes a set of addresses from the whitelist
    function delist(address[] _addresses) ifDelegate external {
        for (uint256 i = 0; i < _addresses.length; i++) {
            whitelist[_addresses[i]] = false;
            Delisted(_addresses[i]);
        }
    }  
}