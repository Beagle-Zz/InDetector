contract c10953{
    /**
        @dev the first step when upgrading a converter is to transfer the ownership to the local contract.
        the upgrader contract then needs to accept the ownership transfer before initiating
        the upgrade process.
        fires the ConverterOwned event upon success
        @param _oldConverter       converter to accept ownership of
    */
    function acceptConverterOwnership(IBancorConverterExtended _oldConverter) private {
        require(msg.sender == _oldConverter.owner());
        _oldConverter.acceptOwnership();
        emit ConverterOwned(_oldConverter, this);
    }
}