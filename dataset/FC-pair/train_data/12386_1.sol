contract c12386{
    // get the token balance for an individual address
    function userBalance(address _owner) public constant returns (uint256) {
        return heldTokens[_owner];
    }
}