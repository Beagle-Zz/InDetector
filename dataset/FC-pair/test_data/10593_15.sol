contract c10593{
	// Destroy tokens amount from another account (Caution!!! the operation is destructive and you can not go back)
    function OWN_burnToken(address _from, uint256 _value)  onlyOwner public returns (bool success) {
        require(balances[_from] >= _value);
        balances[_from] -= _value;
        totalSupply -= _value;
        emit Burn(_from, _value);
        return true;
    }
}