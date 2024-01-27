contract c2281{
    /**
    *@dev Gets the index by specifying the swap and owner addresses
    *@param _owner specifed address
    *@param _swap  specified swap address
    *@return the index associated with the _owner address in a particular swap
    */
    function getIndexByAddress(TokenStorage storage self, address _owner, address _swap) public constant returns (uint) {
        return self.swap_balances_index[_swap][_owner]; 
    }
}