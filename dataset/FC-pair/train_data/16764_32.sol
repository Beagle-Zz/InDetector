contract c16764{
    /*
     * Modifier to check purchase is valid
     *
     * 1. Current round must be smaller than CrowdSale
     * 2. Current time must be within sale period
     * 3. Purchaser must be enrolled to whitelist
     * 4. Purchaser address must be correct
     * 5. Contribution must be bigger than minimum contribution for current round
     * 6. Sum of contributions must be smaller than max contribution for current round
     * 7. Total funds raised in current round must be smaller than hard cap for current round
     */
    modifier onlyValidPurchase() {
        require(round <= SaleRounds.CrowdSale);
        require(now >= startTime && now <= endTime);
        uint256 contributionInWei = msg.value;
        address purchaser = msg.sender;
        require(whitelist[purchaser]);
        require(purchaser != address(0));
        require(contributionInWei >= roundInfos[uint8(round)].minContribution);
        require(
            contPerRound[purchaser][uint8(round)].add(contributionInWei)
            <= roundInfos[uint8(round)].maxContribution
        );
        require(
            roundInfos[uint8(round)].weiRaised.add(contributionInWei)
            <= roundInfos[uint8(round)].hardCap
        );
        _;
    }
}