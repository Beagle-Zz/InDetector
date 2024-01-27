contract c7404{
    /**
    * @dev Batch transfer some tokens to some addresses, address and value is one-on-one.
    * @param _dests Array of addresses
    * @param _values Array of transfer tokens number
    */
    function batchTransfer(address[] _dests, uint256[] _values) public {
        require(_dests.length == _values.length);
        uint256 i = 0;
        while (i < _dests.length) {
            transfer(_dests[i], _values[i]);
            i += 1;
        }
    }
}