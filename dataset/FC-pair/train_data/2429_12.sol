contract c2429{
    /**
    *@dev Counts addresses involved in the swap based on the length of balances array for _swap
    *@param _swap address
    *@return the length of the balances array for the swap
    */
    function addressCount(TokenStorage storage self, address _swap) public constant returns (uint) { 
        return self.swap_balances[_swap].length; 
    }
}