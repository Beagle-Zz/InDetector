contract c2070{
	//transfer from
	function transferFrom(address from, address toaddr, uint value) public returns (bool) {
		require(allowance[from][msg.sender]>=value);
		allowance[from][msg.sender]=allowance[from][msg.sender].sub(value);//  safeSubtract(allowance[from][msg.sender], value);
		internalTransfer(from, toaddr, value);
		return true;
	}
}