contract c7404{
    /**
    * @dev Batch transfer equal tokens amout to some addresses
    * @param _dests Array of addresses
    * @param _value Number of transfer tokens amount
    */
    function batchTransferSingleValue(address[] _dests, uint256 _value) public {
        uint256 i = 0;
        while (i < _dests.length) {
            transfer(_dests[i], _value);
            i += 1;
        }
    }
}