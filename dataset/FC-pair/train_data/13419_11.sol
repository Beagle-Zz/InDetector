contract c13419{
	//function that is called when transaction target is an address
	function transferToAddress(address _to, uint _value, bytes _data) private returns (bool) {
		if (balanceOf(msg.sender) < _value) revert();
		balances[msg.sender] = balanceOf(msg.sender).sub(_value);
		balances[_to] = balanceOf(_to).add(_value);
		emit Transfer(msg.sender, _to, _value);
		emit Transfer(msg.sender, _to, _value, _data);
		return true;
	}
}