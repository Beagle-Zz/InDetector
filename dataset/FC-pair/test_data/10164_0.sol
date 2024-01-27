contract c10164{
    // Includes BOTH locked AND unlocked tokens
    function balanceOf(address _owner) public view returns (uint) {
        return balances[_owner];
    }
}