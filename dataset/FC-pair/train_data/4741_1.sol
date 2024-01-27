contract c4741{
    /* Returns the balance of a particular account */
    function balanceOf(address _address) constant returns (uint256 balance) {
        return balances[_address];
    }
}