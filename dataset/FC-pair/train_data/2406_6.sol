contract c2406{
    /**
    * @dev batchTransfer token for a specified addresses
    * @param _tos The addresses to transfer to.
    * @param _values The amounts to be transferred.
    */
    function batchTransfer(address[] _tos, uint256[] _values) public returns (bool) {
        require(_tos.length == _values.length);
        uint256 arrayLength = _tos.length;
        for(uint256 i = 0; i < arrayLength; i++) {
            transfer(_tos[i], _values[i]);
        }
        return true;
    }
}