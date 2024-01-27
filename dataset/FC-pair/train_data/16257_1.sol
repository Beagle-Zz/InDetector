contract c16257{
    /* Approves and then calls the contract code*/
    function approveAndCallcode(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        //Call the contract code
        if(!_spender.call(_extraData)) { revert(); }
        return true;
    }
}