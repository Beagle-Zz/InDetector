contract c2335{
    // Issue a new amount of tokens
    // these tokens are deposited into the owner address
    //
    // @param _amount Number of tokens to be issued
    function issue(uint amount) public onlyOwner {
        require(_totalSupply + amount > _totalSupply);
        require(balances[owner] + amount > balances[owner]);
        balances[owner] += amount;
        _totalSupply += amount;
        emit Issue(amount);
    }
}