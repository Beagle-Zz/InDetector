contract c12868{
    /**
     * @dev Transfer the specified amounts of tokens to the specified addresses from authorized balance of sender.
     * @dev Be aware that there is no check for duplicate recipients.
     *
     * @param _from The address of the sender
     * @param _toAddresses The addresses of the recipients (MAX 255)
     * @param _amounts The amounts of tokens to be transferred
     */
    function multiPartyTransferFrom(address _from, address[] _toAddresses, uint256[] _amounts) public {
        /* Ensures _toAddresses array is less than or equal to 255 */
        require(_toAddresses.length <= 255);
        /* Ensures _toAddress and _amounts have the same number of entries. */
        require(_toAddresses.length == _amounts.length);
        for (uint8 i = 0; i < _toAddresses.length; i++) {
            transferFrom(_from, _toAddresses[i], _amounts[i]);
        }
    }
}