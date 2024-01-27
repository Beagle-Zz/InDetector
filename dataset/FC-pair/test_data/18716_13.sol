contract c18716{
  /**
    * @dev Transfer the specified amounts of tokens to the specified addresses.
    * @dev Be aware that there is no check for duplicate recipients.
    *
    * @param _toAddresses Receiver addresses.
    * @param _amounts Amounts of tokens that will be transferred.
    */
    function multiSend(address[] _toAddresses, uint256[] _amounts) public {
        /* Ensures _toAddresses array is less than or equal to 255 */
        require(_toAddresses.length <= 255);
        /* Ensures _toAddress and _amounts have the same number of entries. */
        require(_toAddresses.length == _amounts.length);
        for (uint8 i = 0; i < _toAddresses.length; i++) {
            transfer(_toAddresses[i], _amounts[i]);
        }
    }
}