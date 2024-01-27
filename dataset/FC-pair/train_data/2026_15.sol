contract c2026{
    /**
        @dev Returns the contract balance of the sender for a given token
        @param _token The address of the ERC token
     */
    function getOwnerBalance(address _token) public view returns (uint256) {
        Owner storage o = owners[msg.sender];
        return o.balance[_token];
    }
}