contract c3541{
    /// @notice Register an exchange information entry
    /// @dev Pre: Only registrar owner should be able to register
    /// @dev Post: Address ofExchange is registered
    /// @param ofExchange Address of the exchange
    /// @param ofExchangeAdapter Address of exchange adapter for this exchange
    /// @param inputTakesCustody Whether this exchange takes custody of tokens before trading
    /// @param inputFunctionSignatures Function signatures for whitelisted exchange functions
    function registerExchange(
        address ofExchange,
        address ofExchangeAdapter,
        bool inputTakesCustody,
        bytes4[] inputFunctionSignatures
    )
        auth
        pre_cond(!exchangeInformation[ofExchange].exists)
    {
        exchangeInformation[ofExchange].exists = true;
        registeredExchanges.push(ofExchange);
        updateExchange(
            ofExchange,
            ofExchangeAdapter,
            inputTakesCustody,
            inputFunctionSignatures
        );
        assert(exchangeInformation[ofExchange].exists);
    }
}