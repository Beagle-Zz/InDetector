contract c2662{
    /**
     * @dev Checks modifier and allows transfer if tokens are not locked or not released.
     * @param _from The address that will send the tokens.
     * @param _to The address that will receive the tokens.
     * @param _value The amount of tokens to be transferred.
     */
    function transferFrom(address _from, address _to, uint _value)
        validDestination(_to)
        canTransferReleasable(_from)
        canTransferLimitedTransferToken(_from, _value) public returns (bool) {
        // Call StandardToken.transferForm()
        return super.transferFrom(_from, _to, _value);
    }
}