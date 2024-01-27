contract c16771{
    /**
    * Allows for the transfer of MSTCOIN tokens from peer to peer. 
    *
    * @param _to The address of the receiver
    * @param _value The amount of tokens to send
    **/
    function transfer(address _to, uint256 _value) public returns(bool) {
        assert(balances[msg.sender] >= _value && _value > 0 && _to != 0x0);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}