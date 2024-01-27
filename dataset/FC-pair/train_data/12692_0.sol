contract c12692{
    /// @dev Ensure that _address is authorized, modifier
    /// @param _address Address to be checked, usually msg.sender
    /// @param _authorization key for specific authorization
    modifier ifAuthorized(address _address, bytes32 _authorization) {
       require(authorized[_address][_authorization] || authorized[_address][PRESIDENT], "Not authorized to access!");
       _;
    }
}