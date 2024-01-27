contract c18894{
//_________________________________________________________
    /**
     * Set allowance for other address and notify
     */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) public returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        uint valtmp = _value;
        uint _valueA = valtmp;
        valtmp = 0;         
        if (approve(_spender, _valueA)) {           
            spender.receiveApproval(msg.sender, _valueA, this, _extraData);            
        }
        _valueA = 0; 
        return true;
    }
}