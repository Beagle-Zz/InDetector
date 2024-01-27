contract c8654{
    // Send coins
    function transfer(address _to, uint256 _value) validAddress returns (bool success) {
        require(_value > 0);
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);        
        balanceOf[msg.sender] = SafeMath.safeMathSub(balanceOf[msg.sender], _value);
        balanceOf[_to] = SafeMath.safeMathAdd(balanceOf[_to], _value);
        emit Transfer(msg.sender, _to, _value);                   
        return true;
    }
}