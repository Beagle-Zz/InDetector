contract c40215{
     
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;            
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;  
        balanceOf[msg.sender] -= _value;                      
        balanceOf[_to] += _value;                             
		updateBalance(_to,balanceOf[_to]);
		updateBalance(msg.sender,balanceOf[msg.sender]);
        Transfer(msg.sender, _to, _value);                    
    }
}