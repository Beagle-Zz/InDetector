contract c2281{
    /**
    *@dev Gets the owner address and amount by specifying the swap address and index
    *@param _ind specified index in the swap
    *@param _swap specified swap address
    *@return the owner address associated with a particular index in a particular swap
    *@return the amount to transfer associated with a particular index in a particular swap
    */
    function getBalanceAndHolderByIndex(TokenStorage storage self, uint _ind, address _swap) public constant returns (uint, address) {
        return (self.swap_balances[_swap][_ind].amount, self.swap_balances[_swap][_ind].owner);
    }
}