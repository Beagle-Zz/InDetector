contract c2736{
    /// @dev Called by users to contribute ETH to the sale.
    function contribute(
        address _contributor,
        uint256 _contributionLimitUnits, 
        uint256 _payloadExpiration,
        bytes _sig
    ) 
        external 
        payable
        checkAllowed 
        isWhitelisted(keccak256(
            abi.encodePacked(
                _contributor,
                _contributionLimitUnits, 
                _payloadExpiration
            )
        ), _sig)
    {
        require(msg.sender == _contributor);
        require(now < _payloadExpiration); 
        uint256 weiPerUnitRate = ethPriceFeed.getRate(); 
        require(weiPerUnitRate != 0);
        uint256 previouslyContributedUnits = unitContributions[_contributor];
        // Check that the contribution amount doesn't go over the sale cap or personal contributionLimitUnits 
        uint256 currentContributionUnits = min256(
            _contributionLimitUnits.sub(previouslyContributedUnits),
            totalSaleCapUnits.sub(totalContributedUnits),
            msg.value.div(weiPerUnitRate)
        );
        require(currentContributionUnits != 0);
        // Check that it is higher than minContributionUnits
        require(currentContributionUnits >= minContributionUnits || previouslyContributedUnits != 0);
        // Update the state
        unitContributions[_contributor] = previouslyContributedUnits.add(currentContributionUnits);
        totalContributedUnits = totalContributedUnits.add(currentContributionUnits);
        uint256 currentContributionWei = currentContributionUnits.mul(weiPerUnitRate);
        trustedVault.deposit.value(currentContributionWei)(msg.sender);
        // If the minThresholdUnits is reached for the first time, notify the vault
        if (totalContributedUnits >= minThresholdUnits &&
            trustedVault.state() != Vault.State.Success) {
            trustedVault.saleSuccessful();
        }
        // If there is an excess, return it to the sender
        uint256 excessWei = msg.value.sub(currentContributionWei);
        if (excessWei > 0) {
            msg.sender.transfer(excessWei);
        }
        emit Contribution(
            _contributor, 
            msg.sender,
            currentContributionUnits, 
            currentContributionWei, 
            excessWei,
            weiPerUnitRate
        );
        // Allocate tokens     
        uint256 tokenAmount = currentContributionUnits.mul(saleTokensPerUnit);
        trustedToken.safeTransfer(_contributor, tokenAmount);
        emit TokensAllocated(_contributor, tokenAmount);
    }
}