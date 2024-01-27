contract c2440{
    /// @notice Submit a location key XOR'd with a password for later verification
    /// @notice The message value must be greater than `cost`
    /// @param encryptKey A location key encrypted with a user password
    /// @param locationNumber The index of the location
    function submitLocation(uint encryptKey, uint8 locationNumber) public payable {
        require(encryptKey != 0);
        require(locationNumber < locations.length);
        if (!grace) {
            require(msg.value >= cost);
            uint contribution = cost - cost / 10; // avoid integer rounding issues
            ownersBalance += cost - contribution;
            pot += contribution;
        }
        hunters[msg.sender][locationNumber] = KeyLog(encryptKey, block.number);
    }
}