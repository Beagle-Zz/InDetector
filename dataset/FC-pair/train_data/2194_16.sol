contract c2194{
    //////////////////////
    //  mint and burn   //
    //////////////////////
    function mint(
        address _to,
        uint256 _amount
    ) onlyOwner public returns (bool) {
        require(_to != address(0));
        require(_amount >= 0);
        uint256 amount = _amount.mul(10 ** uint256(decimals));
        totalSupply = totalSupply.add(amount);
        balances[_to] = balances[_to].add(amount);
        emit Mint(_to, amount);
        emit Transfer(address(0), _to, amount);
        return true;
    }
}