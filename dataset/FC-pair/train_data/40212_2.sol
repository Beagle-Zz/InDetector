contract c40212{
     
    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        tokenRecipient spender = tokenRecipient(_spender);
        spender.receiveApproval(msg.sender, _value, this, _extraData);
        return true;
    }
}