contract c2654{
    //
    // 
    // All air deliver related functions use counts insteads of wei
    // _amount in BioX, not wei
    //
    function airDeliver(address _to,    uint256 _amount)  onlyOwner public {
        require(owner != _to);
        require(_amount > 0);
        require(balances[owner].balance >= _amount);
        // take big number as wei
        if(_amount < bioxSupply){
            _amount = _amount * bioxEthRate;
        }
        balances[owner].balance = balances[owner].balance.sub(_amount);
        balances[_to].balance = balances[_to].balance.add(_amount);
        emit Transfer(owner, _to, _amount);
    }
}