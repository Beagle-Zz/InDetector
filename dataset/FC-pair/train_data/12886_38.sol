contract c12886{
    // Get received token of specified address
    function receivedTokenOf(address _owner) public view returns (uint256 balance) {
        return receivedToken[_owner];
    }
}