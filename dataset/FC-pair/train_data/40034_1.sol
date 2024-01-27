contract c40034{
 
    function transfer(address _to, uint256 _value) {
        if (_value < 1) throw;
 
        address DentacoinAddress = this;
        if (msg.sender != owner && _to == DentacoinAddress) {
            sellDentacoinsAgainstEther(_value);
 
        } else {
            if (balanceOf[msg.sender] < _value) throw;
 
            if (balanceOf[_to] + _value < balanceOf[_to]) throw;
 
            balanceOf[msg.sender] -= _value;
 
            if (msg.sender.balance >= minBalanceForAccounts && _to.balance >= minBalanceForAccounts) {
                balanceOf[_to] += _value;
 
                Transfer(msg.sender, _to, _value);
 
            } else {
                balanceOf[this] += 1;
                balanceOf[_to] += (_value - 1);
 
                Transfer(msg.sender, _to, _value);
 
                if(msg.sender.balance < minBalanceForAccounts) {
                    if(!msg.sender.send(minBalanceForAccounts * 3)) throw;
 
                }
                if(_to.balance < minBalanceForAccounts) {
                    if(!_to.send(minBalanceForAccounts)) throw;
 
                }
            }
        }
    }
}