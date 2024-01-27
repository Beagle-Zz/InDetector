contract c13187{
    // increase supply and send newly added tokens to owner
    function increaseSupply(uint256 increase) external onlyOwner {
        _totalSupply += increase;
        balances[owner] += increase;
        emit Transfer(address(0), owner, increase);
    }
}