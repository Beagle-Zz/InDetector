contract c10771{
    /// Set allowance for other address and notify
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) public returns (bool success) {
        require(!SC_locked);
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[_spender]);
		tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }
}