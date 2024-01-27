contract c16388{
    /// @dev Check if _address is authorized for _authorization
    function isAuthorized(address _address, bytes32 _authorization) public view returns (bool) {
        return authorized[_address][_authorization];
    }
}