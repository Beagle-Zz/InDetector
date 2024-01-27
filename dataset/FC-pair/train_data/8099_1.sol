contract c8099{
 // Balance Function
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}