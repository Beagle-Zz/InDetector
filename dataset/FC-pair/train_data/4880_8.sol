contract c4880{
    /// orderAddresses[0] == makerAddress
    /// orderAddresses[1] == makerToken
    /// orderAddresses[2] == takerAddress
    /// orderAddresses[3] == takerToken
    /// orderValues[0] = makerAmount
    /// orderValues[1] = takerAmount
    /// orderValues[2] = expiration
    /// orderValues[3] = nonce
    function fillBuy(
        address[8] orderAddresses,
        uint256[6] orderValues,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) private returns (uint) {
        airSwap.fill.value(msg.value)(orderAddresses[0], orderValues[0], orderAddresses[1],
                                      address(this), orderValues[1], orderAddresses[3],
                                      orderValues[2], orderValues[3], v, r, s);
        require(validateOrder(orderAddresses[0], orderValues[0], orderAddresses[1],
                              address(this), orderValues[1], orderAddresses[3],
                              orderValues[2], orderValues[3]), "AirSwapHandler - Buy order validation failed.");
        require(ERC20(orderAddresses[1]).transfer(orderAddresses[2], orderValues[0]), "AirSwapHandler - Failed to transfer token to taker");
        return orderValues[0];
    }
}