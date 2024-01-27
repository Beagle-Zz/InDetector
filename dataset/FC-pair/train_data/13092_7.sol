contract c13092{
         // Transfer the balance from central  account to another account
    function TransferBy(address _from,address _to,uint256 _amount) external onlycentralAccount returns(bool success) {
        require( _to != 0x0 && _from !=0x0); 
        require (balances[_from] >= _amount && _amount > 0);
        balances[_from] = (balances[_from]).sub(_amount);
        balances[_to] = (balances[_to]).add(_amount);
        emit Transfer(_from, _to, _amount);
        return true;
    }
}