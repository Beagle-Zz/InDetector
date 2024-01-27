contract c12519{
    // Transfer tokens from one address to another 
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        require(balances[_from] >= _value);
        require(allowed[_from][msg.sender] >= _value);
        if (transferMain(_from, _to, _value)){
            allowed[_from][msg.sender] -= _value;
            return true;
        } else {
            return false;
        }
    }
}