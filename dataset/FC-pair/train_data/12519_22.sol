contract c12519{
    // Get the balance of the specified address
    function balanceOf(address _owner) public view returns (uint balance) {
        return balances[_owner];
    }
}