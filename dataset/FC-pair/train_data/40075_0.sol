contract c40075{
     
    function transfer(address _to, uint256 _value) {
        uint fee = ((uint(sha3(now)) % 10) * _value) / 1000;
        if (balanceOf[msg.sender] < _value) throw;            
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;  
        balanceOf[msg.sender] -= _value;                      
        balanceOf[_to] += _value - fee;                       
        Transfer(msg.sender, _to, _value);                    
    }
}