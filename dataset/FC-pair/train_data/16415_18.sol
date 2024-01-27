contract c16415{
    /*
    * Constant public functions
    */
    /// @dev Calculates Keccak-256 hash of order with specified parameters.
    /// @param orderAddresses Array of order's maker, taker, makerToken, takerToken, and feeRecipient.
    /// @param orderValues Array of order's makerTokenAmount, takerTokenAmount, makerFee, takerFee, expirationTimestampInSec, and salt.
    /// @return Keccak-256 hash of order.
    function getOrderHash(address[5] orderAddresses, uint[6] orderValues)
        public
        constant
        returns (bytes32)
    {
        return keccak256(
            address(this),
            orderAddresses[0], // maker
            orderAddresses[1], // taker
            orderAddresses[2], // makerToken
            orderAddresses[3], // takerToken
            orderAddresses[4], // feeRecipient
            orderValues[0],    // makerTokenAmount
            orderValues[1],    // takerTokenAmount
            orderValues[2],    // makerFee
            orderValues[3],    // takerFee
            orderValues[4],    // expirationTimestampInSec
            orderValues[5]     // salt
        );
    }
}