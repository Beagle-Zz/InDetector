contract c4877{
    /*
     * Spend tokens to acquire ETH
     */
    function performSell(
        address[8] orderAddresses,
        uint256[6] orderValues,
        uint256 exchangeFee,
        uint256 amountToFill,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint256) {
        require(orderUsable(orderAddresses, orderValues), "0xHandler - sell order validation failed");
        require(orderAddresses[2] == wethAddress, "0xHandler - ordAddr[3] != wethAddress for sell");
        address[5] memory newAddresses = convertAddressFormat(orderAddresses);
        setAllowance(orderAddresses[3]);
        ZeroExExchange(exchangeAddress).fillOrder(newAddresses, orderValues, amountToFill, false, v, r, s);
        uint receivedAmount = getPartialAmount(amountToFill, orderValues[1], orderValues[0]);
        DepositToken(wethAddress).withdraw(receivedAmount);
        msg.sender.transfer(receivedAmount);
        return receivedAmount;
    }
}