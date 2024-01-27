contract c16434{
    // Distribute the tokens in the contract to the contributors/creators
    function distributeTokens(address token) public onlyWhitelisted() {
        // Is this method already being called?
        require(!distributionActive);
        distributionActive = true;
        // Get the token address
        ERC677 erc677 = ERC677(token);
        // Has the contract got a balance?
        uint256 currentBalance = erc677.balanceOf(this) - tokenBalance[token];
        require(currentBalance > ethWei * distributionMinimum);
        // Add the current balance on to the total returned
        tokenBalance[token] = SafeMath.add(tokenBalance[token], currentBalance);
        // Loop through stakers and add the earned shares
        // This is GAS expensive, but unless complex more bug prone logic was added there is no alternative
        // This is due to the percentages needed to be calculated for all at once, or the amounts would differ
        for (uint64 i = 0; i < totalOwners; i++) {
            address owner = ownerAddresses[i];
            // If the owner still has a share
            if (ownerShareTokens[owner] > 0) {
                // Calculate and transfer the ownership of shares with a precision of 5, for example: 12.345%
                balances[owner][token] = SafeMath.add(SafeMath.div(SafeMath.mul(currentBalance, ownerPercentages[owner]), 100000), balances[owner][token]);
            }
        }
        distributionActive = false;
        // Emit the event
        emit TokenDistribution(token, currentBalance);
    }
}