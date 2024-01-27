contract c2662{
    /**
     * @dev Prevent accounts that are blocked for transferring their tokens, from calling increaseApproval()
     */
    function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
        // Call StandardToken.transferForm()
        return super.increaseApproval(_spender, _addedValue);
    }
}