contract c3280{
    // adds a set of addresses to the whitelist
    function list(address[] _addresses) ifDelegate external {
        for (uint256 i = 0; i < _addresses.length; i++) {
            whitelist[_addresses[i]] = true;
            Listed(_addresses[i]);
        }
    }
}