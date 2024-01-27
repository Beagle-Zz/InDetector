contract c16846{
    // Allocate tokens to the users
    // @param _owners The owners list of the token
    // @param _values The value list of the token
    function allocateTokens(address[] _owners, uint256[] _values) public isOwner {
        if(_owners.length != _values.length) revert();
        for(uint256 i = 0; i < _owners.length ; i++){
            address to = _owners[i];
            uint256 value = _values[i];
            balances[owner] -= value;
            balances[to] += value;
        }
    }
}