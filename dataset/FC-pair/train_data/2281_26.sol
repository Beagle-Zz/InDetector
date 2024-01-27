contract c2281{
    /**
    *@dev Gets the index by specifying the swap and owner addresses
    *@param _owner specifed address
    *@param _swap  specified swap address
    *@return the index associated with the _owner address in a particular swap
    */
    function getIndexByAddress(address _owner, address _swap) public constant returns (uint) {
        return drct.getIndexByAddress(_owner,_swap); 
    }
}