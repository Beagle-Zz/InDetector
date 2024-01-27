contract c10572{
    // Function that is called when a user or another contract wants to transfer funds .
    function transfer(address _to, uint256 _value, bytes _data) public  returns (bool success) {
        // Only allow transfer once Locked
        // Once it is Locked, it is Locked forever and no one can lock again
		require(!SC_locked);
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[_to]);
        if (isContract(_to)) {
            return transferToContract(_to, _value, _data);
        } 
        else {
            return transferToAddress(_to, _value, _data);
        }
    }
}