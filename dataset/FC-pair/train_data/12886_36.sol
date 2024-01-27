contract c12886{
    // Get transfered token of specified address
    function transferedTokenOf(address _owner) public view returns (uint256 balance) {
        return transferedToken[_owner];
    }
}