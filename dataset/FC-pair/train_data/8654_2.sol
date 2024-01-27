contract c8654{
    // A contract attempts to get the coins
    function transferFrom(address _from, address _to, uint256 _value) validAddress returns (bool success) {
        require(_value > 0); 
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        require(allowance[_from][msg.sender] >= _value);
        balanceOf[_from] = SafeMath.safeMathSub(balanceOf[_from], _value);                           
        balanceOf[_to] = SafeMath.safeMathAdd(balanceOf[_to], _value);                             
        allowance[_from][msg.sender] = SafeMath.safeMathSub(allowance[_from][msg.sender], _value);
        emit Transfer(_from, _to, _value);
        return true;
    }
}