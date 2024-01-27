contract c13437{
    // Refund ether to the investors (invoke from only token)
    function refund(address _to) public {
        require(msg.sender == tokenContractAddress);
        require(weiRaised.add(preSale.weiRaised()) < softCap && now > endCrowdSaleTime
        || weiRaised.add(preSale.weiRaised()) >= softCap && now > endCrowdSaleTime && now <= endRefundableTime);
        // unsuccessful end of CrowdSale
        if (weiRaised.add(preSale.weiRaised()) < softCap && now > endCrowdSaleTime) {
            refundAll(_to);
            return;
        }
        // successful end of CrowdSale
        if (weiRaised.add(preSale.weiRaised()) >= softCap && now > endCrowdSaleTime && now <= endRefundableTime) {
            refundPart(_to);
            return;
        }
    }
}