contract c2281{
    /**
    *@dev Look up how much the spender or contract is allowed to spend?
    *@param _owner address
    *@param _spender party approved for transfering funds 
    *@return the allowed amount _spender can spend of _owner's balance
    */
    function allowance(address _owner, address _spender) public constant returns (uint) {
        return drct.allowance(_owner,_spender); 
    }
}