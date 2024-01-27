contract c3236{
    /* Send coins */
    function transfer(address _to, uint256 _value) isRunning validAddress unlocked returns (bool success) {	
        _transfer(msg.sender, _to, _value);
    }
}