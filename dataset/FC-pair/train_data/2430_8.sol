contract c2430{
    /**
    *@dev This is the main function to update the mappings when a transfer happens
    *@param _from address to send funds from
    *@param _to address to send funds to
    *@param _amount amount of token to send
    */
    function transferHelper(TokenStorage storage self,address _from, address _to, uint _amount) internal {
        //Get memory copies of the swap arrays for the sender and reciever
        address[] memory from_swaps = self.user_swaps[_from];
        //Iterate over sender's swaps in reverse order until enough tokens have been transferred
        for (uint i = from_swaps.length.sub(1); i > 0; i--) {
            //Get the index of the sender's balance for the current swap
            uint from_swap_user_index = self.swap_balances_index[from_swaps[i]][_from];
            Balance memory from_user_bal = self.swap_balances[from_swaps[i]][from_swap_user_index];
            //If the current swap will be entirely depleted - we remove all references to it for the sender
            if (_amount >= from_user_bal.amount) {
                _amount -= from_user_bal.amount;
                //If this swap is to be removed, we know it is the (current) last swap in the user's user_swaps list, so we can simply decrement the length to remove it
                self.user_swaps[_from].length = self.user_swaps[_from].length.sub(1);
                //Remove the user swap index for this swap
                delete self.user_swaps_index[_from][from_swaps[i]];
                //If the _to address already holds tokens from this swap
                if (self.user_swaps_index[_to][from_swaps[i]] != 0) {
                    //Get the index of the _to balance in this swap
                    uint to_balance_index = self.swap_balances_index[from_swaps[i]][_to];
                    assert(to_balance_index != 0);
                    //Add the _from tokens to _to
                    self.swap_balances[from_swaps[i]][to_balance_index].amount = self.swap_balances[from_swaps[i]][to_balance_index].amount.add(from_user_bal.amount);
                    //Remove the _from address from this swap's balance array
                    removeFromSwapBalances(self,_from, from_swaps[i]);
                } else {
                    //Prepare to add a new swap by assigning the swap an index for _to
                    if (self.user_swaps[_to].length == 0){
                        self.user_swaps[_to].push(address(0x0));
                    }
                self.user_swaps_index[_to][from_swaps[i]] = self.user_swaps[_to].length;
                //Add the new swap to _to
                self.user_swaps[_to].push(from_swaps[i]);
                //Give the reciever the sender's balance for this swap
                self.swap_balances[from_swaps[i]][from_swap_user_index].owner = _to;
                //Give the reciever the sender's swap balance index for this swap
                self.swap_balances_index[from_swaps[i]][_to] = self.swap_balances_index[from_swaps[i]][_from];
                //Remove the swap balance index from the sending party
                delete self.swap_balances_index[from_swaps[i]][_from];
            }
            //If there is no more remaining to be removed, we break out of the loop
            if (_amount == 0)
                break;
            } else {
                //The amount in this swap is more than the amount we still need to transfer
                uint to_swap_balance_index = self.swap_balances_index[from_swaps[i]][_to];
                //If the _to address already holds tokens from this swap
                if (self.user_swaps_index[_to][from_swaps[i]] != 0) {
                    //Because both addresses are in this swap, and neither will be removed, we simply update both swap balances
                    self.swap_balances[from_swaps[i]][to_swap_balance_index].amount = self.swap_balances[from_swaps[i]][to_swap_balance_index].amount.add(_amount);
                } else {
                    //Prepare to add a new swap by assigning the swap an index for _to
                    if (self.user_swaps[_to].length == 0){
                        self.user_swaps[_to].push(address(0x0));
                    }
                    self.user_swaps_index[_to][from_swaps[i]] = self.user_swaps[_to].length;
                    //And push the new swap
                    self.user_swaps[_to].push(from_swaps[i]);
                    //_to is not in this swap, so we give this swap a new balance index for _to
                    self.swap_balances_index[from_swaps[i]][_to] = self.swap_balances[from_swaps[i]].length;
                    //And push a new balance for _to
                    self.swap_balances[from_swaps[i]].push(Balance({
                        owner: _to,
                        amount: _amount
                    }));
                }
                //Finally, update the _from user's swap balance
                self.swap_balances[from_swaps[i]][from_swap_user_index].amount = self.swap_balances[from_swaps[i]][from_swap_user_index].amount.sub(_amount);
                //Because we have transferred the last of the amount to the reciever, we break;
                break;
            }
        }
    }
}