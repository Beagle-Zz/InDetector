contract c16953{
    /**
     * Purchases access to this stream for msg.sender.
     * If the address already has a valid subscription, extends the subscription by the given period.
     */
    function buy(bytes32 productId, uint subscriptionSeconds) public whenNotHalted {
        var (, product, sub) = _getSubscription(productId, msg.sender);
        require(product.state == ProductState.Deployed, "error_notDeployed");
        _addSubscription(product, msg.sender, subscriptionSeconds, sub);
        uint price = getPriceInData(subscriptionSeconds, product.pricePerSecond, product.priceCurrency);        
        require(datacoin.transferFrom(msg.sender, product.beneficiary, price), "error_paymentFailed");
    }
}