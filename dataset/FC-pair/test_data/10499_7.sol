contract c10499{
    // Added due to backwards compatibility reasons .
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // Only allow transfer once Locked
        require(!SC_locked);
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[_to]);
        //standard function transfer similar to ERC20 transfer with no _data
        if (isContract(_to)) {
            return transferToContract(_to, _value);
        } 
        else {
            return transferToAddress(_to, _value);
        }
    }
}