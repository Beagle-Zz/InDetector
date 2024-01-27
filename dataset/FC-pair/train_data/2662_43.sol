contract c2662{
    /**
     * @dev Prevent accounts that are blocked for transferring their tokens, from calling approve()
     */
    function approve(address _spender, uint256 _value) public returns (bool) {
        // Call StandardToken.transferForm()
        return super.approve(_spender, _value);
    }
}