contract c8371{
    /* Send coins */
    function transfer(address _to, uint256 _value) public{
		_transfer(msg.sender,_to,_value);
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }
}