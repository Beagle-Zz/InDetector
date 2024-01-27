contract c2280{
    /**
    *@dev Allows an address with sufficient spending allowance to send tokens on the behalf of _from
    *@param _from The address to send tokens from
    *@param _to The address to send tokens to
    *@param _amount The amount of tokens to send
    */
    function transferFrom(address _from, address _to, uint _amount) public returns (bool) {
        if (balances[_from] >= _amount
        && allowed[_from][msg.sender] >= _amount
        && _amount > 0
        && balances[_to] + _amount > balances[_to]) {
            balances[_from] = balances[_from] - _amount;
            allowed[_from][msg.sender] = allowed[_from][msg.sender] - _amount;
            balances[_to] = balances[_to] + _amount;
            emit Transfer(_from, _to, _amount);
            return true;
        } else {
            return false;
        }
    }
}