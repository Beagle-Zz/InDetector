contract c12070{
    /* Get the account balance for an address */
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
}