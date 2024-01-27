contract c16388{
    /// @dev Change authorization for _address 
    /// @param _address Address whose permission is to be changed
    /// @param _authorization Authority to be changed
    function toggleAuthorization(address _address, bytes32 _authorization) public ifAuthorized(msg.sender, APHRODITE) {
        /// Prevent inadvertent self locking out, cannot change own authority
        require(_address != msg.sender);
        /// No need for lower level authorization to linger
        if (_authorization == APHRODITE && !authorized[_address][APHRODITE]) {
            authorized[_address][CUPID] = false;
        }
        authorized[_address][_authorization] = !authorized[_address][_authorization];
    }
}