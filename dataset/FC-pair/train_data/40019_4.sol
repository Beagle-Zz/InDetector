contract c40019{
     
    function get_available_interest_amount () returns (uint256) {
        return balances[thebank];
    }
}