contract c10120{
    /* Multiple token transfers from one address to save gas */
    function transferMultiple(address[] _addresses, uint[] _amounts) external {
        require(_addresses.length <= 100);
        require(_addresses.length == _amounts.length);
        // do the transfers
        for (uint j; j < _addresses.length; j++) {
            transfer(_addresses[j], _amounts[j]);
        }
    }
}