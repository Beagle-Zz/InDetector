contract c2166{
    /**
     * @dev Checks modifier and allows transfer if tokens are not locked or not released.
     * @param _to The address that will receive the tokens.
     * @param _value The amount of tokens to be transferred.
     */
    function transfer(address _to, uint _value)
        validDestination(_to)
        canTransferReleasable(msg.sender)
        canTransferLimitedTransferToken(msg.sender, _value) public returns (bool) {
        // Call BasicToken.transfer()
        return super.transfer(_to, _value);
    }
}