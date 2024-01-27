contract c4880{
    /// orderAddresses[0] == makerAddress
    /// orderAddresses[1] == makerToken
    /// orderAddresses[2] == takerAddress
    /// orderAddresses[3] == takerToken
    /// orderValues[0] = makerAmount
    /// orderValues[1] = takerAmount
    /// orderValues[2] = expiration
    /// orderValues[3] = nonce
    function fillSell(
        address[8] orderAddresses,
        uint256[6] orderValues,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) private
    returns (uint)
    {
        require(orderAddresses[1] == address(weth), "AirSwapHandler - makerToken is not WETH for sell order");
        uint takerAmount = orderValues[1];
        if(ERC20(orderAddresses[3]).allowance(address(this), address(airSwap)) == 0) {
            require(ERC20(orderAddresses[3]).approve(address(airSwap), MAX_UINT), "AirSwapHandler - unable to set token approval for sell order");
        }
        airSwap.fill(orderAddresses[0], orderValues[0], orderAddresses[1],
                     address(this), takerAmount, orderAddresses[3],
                     orderValues[2], orderValues[3], v, r, s);
        require(validateOrder(orderAddresses[0], orderValues[0], orderAddresses[1],
                              address(this), takerAmount, orderAddresses[3],
                              orderValues[2], orderValues[3]), "AirSwapHandler - sell order validation failed.");
        weth.withdraw(orderValues[0]);
        msg.sender.transfer(orderValues[0]);
        return orderValues[0];
    }
}