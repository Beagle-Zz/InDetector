contract c10499{
    // function that is called when transaction target is a contract
    function transferToContract(address _to, uint256 _value) private returns (bool success) {
        require(SmartContract_Allowed[_to]);
		if (balanceOf(msg.sender) < _value) revert();
        balances[msg.sender] = safeSub(balanceOf(msg.sender), _value);
        balances[_to] = safeAdd(balanceOf(_to), _value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}