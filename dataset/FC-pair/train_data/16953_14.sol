contract c16953{
    /**
    * Transfer a valid subscription from msg.sender to a new address.
    * If the address already has a valid subscription, extends the subscription by the msg.sender's remaining period.
    */
    function transferSubscription(bytes32 productId, address newSubscriber) public whenNotHalted {
        var (isValid, product, sub) = _getSubscription(productId, msg.sender);
        require(isValid, "error_subscriptionNotValid");
        uint secondsLeft = sub.endTimestamp.sub(block.timestamp);        
        TimeBasedSubscription storage newSub = product.subscriptions[newSubscriber];
        _addSubscription(product, newSubscriber, secondsLeft, newSub);
        delete product.subscriptions[msg.sender];
        emit SubscriptionTransferred(productId, msg.sender, newSubscriber, secondsLeft);
    }
}