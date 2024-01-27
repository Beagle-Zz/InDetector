contract c2918{
    // Allocate tokens to the users
    // @param _owners The owners list of the token
    // @param _values The value list of the token
    function allocateTokens(address[] _owners, uint256[] _values) public onlyOwner {
        require(_owners.length == _values.length, "data length mismatch");
        address from = msg.sender;
        for(uint256 i = 0; i < _owners.length ; i++){
            address to = _owners[i];
            uint256 value = _values[i];
            require(value <= balances[from]);
            balances[to] = balances[to].add(value);
            balances[from] = balances[from].sub(value);
            emit Transfer(from, to, value);
        }
    }
}