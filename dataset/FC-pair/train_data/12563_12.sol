contract c12563{
    /// @dev Synchronously executes an array of orders
    /// @notice The first four parameters relate to Token orders, the last eight relate to DEX orders
    /// @param tokenAddresses Array of addresses of ERC20 Token contracts for each Token order
    /// @param buyOrSell Array indicating whether each Token order is a buy or sell
    /// @param amountToObtain Array indicating the amount (in ether or tokens) to obtain in the order
    /// @param amountToGive Array indicating the amount (in ether or tokens) to give in the order
    /// @param tokenForOrder Array of addresses of ERC20 Token contracts for each DEX order
    /// @param exchanges Array of addresses of exchange handler contracts
    /// @param orderAddresses Array of address values needed for each DEX order
    /// @param orderValues Array of uint values needed for each DEX order
    /// @param exchangeFees Array indicating the fee for each DEX order (percentage of fill amount as decimal * 10**18)
    /// @param v ECDSA signature parameter v
    /// @param r ECDSA signature parameter r
    /// @param s ECDSA signature parameter s
    function executeOrders(
        // Tokens
        address[] tokenAddresses,
        bool[]    buyOrSell,
        uint256[] amountToObtain,
        uint256[] amountToGive,
        // DEX Orders
        address[] tokenForOrder,
        address[] exchanges,
        address[8][] orderAddresses,
        uint256[6][] orderValues,
        uint256[] exchangeFees,
        uint8[] v,
        bytes32[] r,
        bytes32[] s
    ) public payable {
        require(
            tokenAddresses.length == buyOrSell.length &&
            buyOrSell.length      == amountToObtain.length &&
            amountToObtain.length == amountToGive.length
        );
        require(
            tokenForOrder.length  == exchanges.length &&
            exchanges.length      == orderAddresses.length &&
            orderAddresses.length == orderValues.length &&
            orderValues.length    == exchangeFees.length &&
            exchangeFees.length   == v.length &&
            v.length              == r.length &&
            r.length              == s.length
        );
        // Wrapping order in structs to reduce local variable count
        internalOrderExecution(
            Tokens(
                tokenAddresses,
                buyOrSell,
                amountToObtain,
                amountToGive
            ),
            DEXOrders(
                tokenForOrder,
                exchanges,
                orderAddresses,
                orderValues,
                exchangeFees,
                v,
                r,
                s
            )
        );
    }
}