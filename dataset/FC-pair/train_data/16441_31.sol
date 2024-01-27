contract c16441{
    // Update of reservedWei for withdraw
    function updateReservedWei() public {
        require(weiRaised.add(preSale.weiRaised()) >= softCap && now > endCrowdSaleTime);
        uint256 curWei;
        if (!firstStageRefund && now > endCrowdSaleTime) {
            curWei = 500 * 0.000001 ether;
            reservedWei = curWei;
            restWei = weiRaised.sub(curWei);
            firstStageRefund = true;
        }
        if (!secondStageRefund && now > endCrowdSaleTime + 99 * 1 minutes) {
            curWei = restWei.mul(30).div(100);
            reservedWei = reservedWei.add(curWei);
            restWei = restWei.sub(curWei);
            secondStageRefund = true;
        }
        if (!finalStageRefund && now > endRefundableTime) {
            reservedWei = reservedWei.add(restWei);
            restWei = 0;
            finalStageRefund = true;
        }
    }
}