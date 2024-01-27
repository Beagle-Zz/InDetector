contract c3065{
    // NOTE: _amount of 1 FCT is 10 ** decimals
    function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
        require(_to != address(0));
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
        return true;
    }
}