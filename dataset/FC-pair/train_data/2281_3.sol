contract c2281{
    /**
    *@dev Token Creator - This function is called by the factory contract and creates new tokens
    *for the user
    *@param _supply amount of DRCT tokens created by the factory contract for this swap
    *@param _owner address
    *@param _swap address
    */
    function createToken(TokenStorage storage self,uint _supply, address _owner, address _swap) public{
        require(msg.sender == self.factory_contract);
        //Update total supply of DRCT Tokens
        self.total_supply = self.total_supply.add(_supply);
        //Update the total balance of the owner
        self.user_total_balances[_owner] = self.user_total_balances[_owner].add(_supply);
        //If the user has not entered any swaps already, push a zeroed address to their user_swaps mapping to prevent default value conflicts in user_swaps_index
        if (self.user_swaps[_owner].length == 0)
            self.user_swaps[_owner].push(address(0x0));
        //Add a new swap index for the owner
        self.user_swaps_index[_owner][_swap] = self.user_swaps[_owner].length;
        //Push a new swap address to the owner's swaps
        self.user_swaps[_owner].push(_swap);
        //Push a zeroed Balance struct to the swap balances mapping to prevent default value conflicts in swap_balances_index
        self.swap_balances[_swap].push(Balance({
            owner: 0,
            amount: 0
        }));
        //Add a new owner balance index for the swap
        self.swap_balances_index[_swap][_owner] = 1;
        //Push the owner's balance to the swap
        self.swap_balances[_swap].push(Balance({
            owner: _owner,
            amount: _supply
        }));
        emit CreateToken(_owner,_supply);
    }
}