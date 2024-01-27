contract c13307{
	// Standard function transfer similar to ERC20 transfer with no _data .
	// Added due to backwards compatibility reasons .
	function transfer(address _to, uint _value) public whenNotPaused returns (bool) {
		//standard function transfer similar to ERC20 transfer with no _data
		//added due to backwards compatibility reasons
		bytes memory empty;
		if(isContract(_to)) {
			return transferToContract(_to, _value, empty);
		}
		else {
			return transferToAddress(_to, _value, empty);
		}
	}
}