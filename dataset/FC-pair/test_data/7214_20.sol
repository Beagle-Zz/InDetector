contract c7214{
    // EXTERNAL : MANAGING
    /// @notice Universal method for calling exchange functions through adapters
    /// @notice See adapter contracts for parameters needed for each exchange
    /// @param exchangeIndex Index of the exchange in the "exchanges" array
    /// @param method Signature of the adapter method to call (as per ABI spec)
    /// @param orderAddresses [0] Order maker
    /// @param orderAddresses [1] Order taker
    /// @param orderAddresses [2] Order maker asset
    /// @param orderAddresses [3] Order taker asset
    /// @param orderAddresses [4] Fee recipient
    /// @param orderValues [0] Maker token quantity
    /// @param orderValues [1] Taker token quantity
    /// @param orderValues [2] Maker fee
    /// @param orderValues [3] Taker fee
    /// @param orderValues [4] Timestamp (seconds)
    /// @param orderValues [5] Salt/nonce
    /// @param orderValues [6] Fill amount: amount of taker token to be traded
    /// @param orderValues [7] Dexy signature mode
    /// @param identifier Order identifier
    /// @param v ECDSA recovery id
    /// @param r ECDSA signature output r
    /// @param s ECDSA signature output s
    function callOnExchange(
        uint exchangeIndex,
        bytes4 method,
        address[5] orderAddresses,
        uint[8] orderValues,
        bytes32 identifier,
        uint8 v,
        bytes32 r,
        bytes32 s
    )
        external
    {
        require(modules.pricefeed.exchangeMethodIsAllowed(
            exchanges[exchangeIndex].exchange, method
        ));
        require((exchanges[exchangeIndex].exchangeAdapter).delegatecall(
            method, exchanges[exchangeIndex].exchange,
            orderAddresses, orderValues, identifier, v, r, s
        ));
    }
}