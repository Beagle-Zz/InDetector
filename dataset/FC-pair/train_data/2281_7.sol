contract c2281{
    /**
    *@dev Removes the address from the swap balances for a swap, and moves the last address in the
    *swap into their place
    *@param _remove address of prevous owner
    *@param _swap address used to get last addrss of the swap to replace the removed address
    */
    function removeFromSwapBalances(TokenStorage storage self,address _remove, address _swap) internal {
        uint last_address_index = self.swap_balances[_swap].length.sub(1);
        address last_address = self.swap_balances[_swap][last_address_index].owner;
        //If the address we want to remove is the final address in the swap
        if (last_address != _remove) {
            uint remove_index = self.swap_balances_index[_swap][_remove];
            //Update the swap's balance index of the last address to that of the removed address index
            self.swap_balances_index[_swap][last_address] = remove_index;
            //Set the swap's Balance struct at the removed index to the Balance struct of the last address
            self.swap_balances[_swap][remove_index] = self.swap_balances[_swap][last_address_index];
        }
        //Remove the swap_balances index for this address
        delete self.swap_balances_index[_swap][_remove];
        //Finally, decrement the swap balances length
        self.swap_balances[_swap].length = self.swap_balances[_swap].length.sub(1);
    }
}