contract c40018{
     
    function get_available_interest_amount () constant  returns (uint256) {
        return balances[thebank];
    }
}