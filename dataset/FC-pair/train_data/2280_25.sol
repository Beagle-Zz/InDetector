contract c2280{
    /**
    *@dev Gets the owner address and amount by specifying the swap address and index
    *@param _ind specified index in the swap
    *@param _swap specified swap address
    *@return the amount to transfer associated with a particular index in a particular swap
    *@return the owner address associated with a particular index in a particular swap
    */
    function getBalanceAndHolderByIndex(uint _ind, address _swap) public constant returns (uint, address) {
        return drct.getBalanceAndHolderByIndex(_ind,_swap);
    }
}