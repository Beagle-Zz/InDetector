contract c13419{
	//function that is called when transaction target is a contract
	function transferToContract(address _to, uint _value, bytes _data) private returns (bool) {
		ContractReceiver receiver = ContractReceiver(_to);
		uint256 price;
		address owner;
		(price, owner) = receiver.doTransfer(msg.sender, bytesToUint(_data));
		if (balanceOf(msg.sender) < price) revert();
		balances[msg.sender] = balanceOf(msg.sender).sub(price);
		balances[owner] = balanceOf(owner).add(price);
		receiver.tokenFallback(msg.sender, price, _data);
		emit Transfer(msg.sender, _to, _value);
		emit Transfer(msg.sender, _to, _value, _data);
		return true;
	}
}