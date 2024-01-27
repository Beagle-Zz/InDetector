contract c12075{
    /*
     * Returns the remaining amount of the taker token available from this
     * order.
     */
    function getAvailableAmount(
        address[8] orderAddresses,
        uint256[6] orderValues,
        uint256 exchangeFee,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256) {
        if (!orderUsable(orderAddresses, orderValues)) {
            return 0;
        }
        address[5] memory newAddresses = convertAddressFormat(orderAddresses);
        bytes32 orderHash = ZeroExExchange(exchangeAddress).getOrderHash(newAddresses, orderValues);
        return SafeMath.sub(orderValues[1], ZeroExExchange(exchangeAddress).getUnavailableTakerTokenAmount(orderHash));
    }
}