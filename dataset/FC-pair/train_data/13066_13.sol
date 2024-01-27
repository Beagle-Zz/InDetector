contract c13066{
    // Standard ERC20.
    function balanceOf(address _owner) view public returns (uint256 balance) {
        return balances[_owner];
    }
}