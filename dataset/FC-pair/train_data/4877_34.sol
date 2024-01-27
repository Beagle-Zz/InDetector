contract c4877{
    /*
     * Spend ETH to acquire tokens
     */
    function performBuy(
        address[8] orderAddresses,
        uint256[6] orderValues,
        uint256 exchangeFee,
        uint256 amountToFill,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external payable returns (uint256) {
        require(orderUsable(orderAddresses, orderValues), "0xHandler - buy order validation failed");
        require(orderAddresses[3] == wethAddress, "0xHandler - ordAddr[3] != wethAddress for buy");
        require(amountToFill == msg.value, "0xHandler - amountToFill != msg.value for buy");
        DepositToken(wethAddress).deposit.value(amountToFill)();
        address[5] memory newAddresses = convertAddressFormat(orderAddresses);
        bytes32 orderHash = ZeroExExchange(exchangeAddress).getOrderHash(newAddresses, orderValues);
        setAllowance(wethAddress);
        ZeroExExchange(exchangeAddress).fillOrder(newAddresses, orderValues, amountToFill, true, v, r, s);
        uint receivedAmount = getPartialAmount(amountToFill, orderValues[1], orderValues[0]);
        require(
            Token(newAddresses[2]).transfer(msg.sender, receivedAmount),
            "0xHandler - failed to transfer bought tokens"
        );
        return receivedAmount;
    }
}