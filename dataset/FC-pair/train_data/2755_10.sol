contract c2755{
    /**
     * @dev Create and sends tokens to `_address` considering amount funded and `conversionRate`.
     *
     * @param _address The address of the receiver of tokens.
     * @param _amount The amount of received funds in ether.
     */
    function receiveFunds(address _address, uint256 _amount) internal {
        validateTransaction();
        uint256 tokens = calculateTokens(_amount);
        require(tokens > 0);
        totalRaised = totalRaised.plus(_amount);
        handleTokens(_address, tokens);
        handleFunds(_address, _amount);
        emit FundsReceived(_address, msg.value, tokens);
    }
}