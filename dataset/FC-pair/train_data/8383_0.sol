contract c8383{
    /// ERC20 balanceOf().
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
}