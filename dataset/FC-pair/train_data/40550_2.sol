contract c40550{
         
        function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
            if (balanceOf[_from] < _value) throw;                  
            if (balanceOf[_to] + _value < balanceOf[_to]) throw;   
            if (spentAllowance[_from][msg.sender] + _value > allowance[_from][msg.sender]) throw;    
            balanceOf[_from] -= _value;                           
            balanceOf[_to] += _value;                             
            spentAllowance[_from][msg.sender] += _value;
            Transfer(msg.sender, _to, _value); 
			return true;
        } 
}