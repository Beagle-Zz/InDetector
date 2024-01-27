contract c2429{
    /**
    *@dev Called by the factory contract, and pays out to a _party
    *@param _party being paid
    *@param _swap address
    */
    function pay(TokenStorage storage self,address _party, address _swap) public{
        require(msg.sender == self.factory_contract);
        uint party_balance_index = self.swap_balances_index[_swap][_party];
        require(party_balance_index > 0);
        uint party_swap_balance = self.swap_balances[_swap][party_balance_index].amount;
        //reduces the users totals balance by the amount in that swap
        self.user_total_balances[_party] = self.user_total_balances[_party].sub(party_swap_balance);
        //reduces the total supply by the amount of that users in that swap
        self.total_supply = self.total_supply.sub(party_swap_balance);
        //sets the partys balance to zero for that specific swaps party balances
        self.swap_balances[_swap][party_balance_index].amount = 0;
    }
}