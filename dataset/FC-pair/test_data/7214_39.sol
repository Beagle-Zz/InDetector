contract c7214{
    /// @notice Deletes an existing entry
    /// @dev Owner can delete an existing entry
    /// @param ofExchange address for which specific information is requested
    /// @param exchangeIndex index of the exchange in array
    function removeExchange(
        address ofExchange,
        uint exchangeIndex
    )
        auth
        pre_cond(exchangeInformation[ofExchange].exists)
    {
        require(registeredExchanges[exchangeIndex] == ofExchange);
        delete exchangeInformation[ofExchange];
        delete registeredExchanges[exchangeIndex];
        for (uint i = exchangeIndex; i < registeredExchanges.length-1; i++) {
            registeredExchanges[i] = registeredExchanges[i+1];
        }
        registeredExchanges.length--;
        assert(!exchangeInformation[ofExchange].exists);
    }
}