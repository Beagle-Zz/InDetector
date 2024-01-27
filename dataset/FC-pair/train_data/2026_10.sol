contract c2026{
    /**
        @dev Claim tokens by a owner address to add them to their balance
        @param _owner The address of the owner to claim tokens for
     */
    function claimTokens(address _owner) public {
        Owner storage o = owners[_owner];
        Distribution storage d = distributions[totalDistributions]; 
        require(o.shareTokens > 0, "You need to have a share to claim tokens");
        require(distributionActive, "Distribution isn't active");
        require(!d.claimedAddresses[_owner], "Tokens already claimed for this address");
        address token = d.token;
        uint256 tokenAmount = d.amount.mul(o.percentage).div(100000);
        o.balance[token] = o.balance[token].add(tokenAmount);
        tokenBalance[token] = tokenBalance[token].add(tokenAmount);
        d.claimed++;
        d.claimedAddresses[_owner] = true;
        emit ClaimedTokens(_owner, token, tokenAmount, d.claimed, totalDistributions);
        if (d.claimed == d.owners) {
            distributionActive = false;
            emit TokenDistributionComplete(token, totalOwners);
        }
    }
}