contract c2280{
    /**
    *@param _owner is the owner address used to look up the balance
    *@return Returns the balance associated with the passed in _owner
    */
    function balanceOf(address _owner) public constant returns (uint bal) { 
        return balances[_owner]; 
    }
}