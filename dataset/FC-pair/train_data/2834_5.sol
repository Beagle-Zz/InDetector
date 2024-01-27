contract c2834{
    /**
     * @dev Transfer the specified amount of tokens to the specified address.
     *      This function works the same with the previous one
     *      but doesn't contain `_data` param.
     *      Added due to backwards compatibility reasons.
     *
     * @param _to    Receiver address.
     * @param _value Amount of tokens that will be transferred.
     */
    function transfer(address _to, uint _value) whenNotPaused external returns (bool success){
        require(balances[msg.sender] >= _value && _value > 0);
        bytes memory empty;
        if(isContract(_to)){
           return transferToContract(_to, _value, empty);
        }
        else
        {
            return transferToAddress(_to, _value, empty);
        }
        //emit Transfer(msg.sender, _to, _value, empty);
    }
}