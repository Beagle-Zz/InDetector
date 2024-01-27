contract c12692{
    /// @dev Check _address' authorization, boolean function
    /// @param _address Boolean value, true if authorized, false otherwise
    /// @param _authorization key for specific authorization
    function isAuthorized(address _address, bytes32 _authorization) public view returns (bool) {
       return authorized[_address][_authorization];
    }
}