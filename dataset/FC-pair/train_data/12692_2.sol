contract c12692{
    /// @dev Toggle boolean flag to allow or prevent access
    /// @param _address Boolean value, true if authorized, false otherwise
    /// @param _authorization key for specific authorization
    function toggleAuthorization(address _address, bytes32 _authorization) public ifAuthorized(msg.sender, PRESIDENT) {
       /// Prevent inadvertent self locking out, cannot change own authority
       require(_address != msg.sender, "Cannot change own permissions.");
       /// No need for lower level authorization to linger
       if (_authorization == PRESIDENT && !authorized[_address][PRESIDENT])
           authorized[_address][STAFF_MEMBER] = false;
       authorized[_address][_authorization] = !authorized[_address][_authorization];
    }
}