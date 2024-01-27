contract c7920{
    // increase supply and send newly added tokens to owner
    function increaseSupply(uint256 increase) external onlyOwner {
        _totalSupply = _totalSupply.add(increase);
        balances[owner] = balances[owner].add(increase);
        emit Transfer(address(0), owner, increase);
    }
}