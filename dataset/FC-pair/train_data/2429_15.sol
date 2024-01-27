contract c2429{
    /**
    *@dev Look up how much the spender or contract is allowed to spend?
    *@param _owner 
    *@param _spender party approved for transfering funds 
    *@return the allowed amount _spender can spend of _owner's balance
    */
    function allowance(TokenStorage storage self, address _owner, address _spender) public constant returns (uint) {
        return self.allowed[_owner][_spender]; 
    }
}