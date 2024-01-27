contract c10934{
	 /// Destroy tokens amount (Caution!!! the operation is destructive and you can not go back)
    function OWN_burn(uint256 _value) onlyOwner public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }
}