contract c2736{
    /// @dev Called to allocate the tokens depending on amount contributed by the end of the sale.
    /// @param _contributor The address of the contributor.
    function allocateExtraTokens(address _contributor)
        external 
        checkAllowed
    {    
        require(!extraTokensAllocated[_contributor]);
        require(unitContributions[_contributor] != 0);
        // Allocate extra tokens only if total sale cap is not reached
        require(totalContributedUnits < totalSaleCapUnits);
        // Transfer the respective tokens to the contributor
        extraTokensAllocated[_contributor] = true;
        uint256 tokenAmount = unitContributions[_contributor].mul(extraTokensPerUnit);
        trustedToken.safeTransfer(_contributor, tokenAmount);
        emit TokensAllocated(_contributor, tokenAmount);
    }
}