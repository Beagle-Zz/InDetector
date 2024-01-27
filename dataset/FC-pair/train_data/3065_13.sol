contract c3065{
    // NOTE: _amount of 1 FCT is 10 ** decimals
    function burn(uint256 _amount) onlyOwner public {
        require(_amount <= balances[msg.sender]);
        totalSupply_ = totalSupply_.sub(_amount);
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        emit Burn(msg.sender, _amount);
        emit Transfer(msg.sender, address(0), _amount);
    }
}