contract c7266{
	// Transfer amount of tokens from sender account to recipient.
    function transfer(address _to, uint _value)
        public
        canTransfer(msg.sender, _value)
		returns (bool success)
	{
        return super.transfer(_to, _value);
    }
}