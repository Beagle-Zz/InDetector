contract c16388{
    /// Check if _address is authorized to access functionality with _authorization level
    modifier ifAuthorized(address _address, bytes32 _authorization) {
        require(authorized[_address][_authorization] || authorized[_address][APHRODITE]);
        _;
    }
}