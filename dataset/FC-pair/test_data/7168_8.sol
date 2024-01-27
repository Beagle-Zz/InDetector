contract c7168{
    //========================================================================
    // Transfer and call function for calling functions in other contracts
    // while sending this token
    //========================================================================
    function transferAndCall(address _recipient, uint _value, uint[] _extraData) public {
        transfer(_recipient, _value);
        require(TokenRecipient(_recipient).tokenFallback(msg.sender, _value, _extraData));
    }
}