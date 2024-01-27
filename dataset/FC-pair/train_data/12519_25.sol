contract c12519{
    // Main transfer function. Checking of balances is made in calling function
    function transferMain(address _from, address _to, uint _value) private returns (bool success) {
        require(_to != address(0));
        assert(balances[_to] + _value >= balances[_to]);
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}