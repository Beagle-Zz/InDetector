contract c10442{
    // This function is to vest tokens to the founding team
    // This deliberately doesn't use SafeMath as all the values are controlled without risk of overflow
    function vestTokens() public returns (bool) {
        require(pendingInstallments > 0);
        require(paidInstallments < 7);
        require(pendingVestingPool > 0);
        require(now - startTime > cliff);
        // If they have rewards pending, allocate those first
        if (!rewardGenerationComplete) {
            for (uint256 i = 1; i <= 5; i++) {
                addReward(distributionAddresses[i]);
            }
        }
        uint256 currInterval = intervalAtTime(now);
        uint256 tokensToVest = 0;
        uint256 totalTokensToVest = 0;
        uint256 totalPool = totalVestingPool;
        uint256[2] memory founderCat;
        founderCat[0] = 0;
        founderCat[1] = 0;
        uint256[5] memory origFounderBal;
        origFounderBal[0] = accounts[distributionAddresses[1]].balance;
        origFounderBal[1] = accounts[distributionAddresses[2]].balance;
        origFounderBal[2] = accounts[distributionAddresses[3]].balance;
        origFounderBal[3] = accounts[distributionAddresses[4]].balance;
        origFounderBal[4] = accounts[distributionAddresses[5]].balance;
        uint256[2] memory rewardCat;
        rewardCat[0] = 0;
        rewardCat[1] = 0;
        // Pay out cliff
        if (paidInstallments < 1) {
            uint256 intervalAtCliff = intervalAtTime(cliff + startTime);
            tokensToVest = totalPool / 4;
            founderCat[0] = tokensToVest / 4;
            founderCat[1] = tokensToVest / 8;
            // Update vesting pool
            pendingVestingPool -= tokensToVest;
            // This condition checks if there are any rewards to pay after the cliff
            if (currInterval > intervalAtCliff && !rewardGenerationComplete) {
                rewardCat[0] = tokensOwedByInterval(founderCat[0], intervalAtCliff, currInterval);
                rewardCat[1] = rewardCat[0] / 2;
                // Add rewards to founder tokens being vested
                founderCat[0] += rewardCat[0];
                founderCat[1] += rewardCat[1];
                // Increase total amount of tokens to vest
                tokensToVest += ((3 * rewardCat[0]) + (2 * rewardCat[1]));
                // Reduce pending rewards
                pendingRewardsToMint -= ((3 * rewardCat[0]) + (2 * rewardCat[1]));
            }
            // Vest tokens for each of the founders, this includes any rewards pending since cliff passed
            accounts[distributionAddresses[1]].balance += founderCat[0];
            accounts[distributionAddresses[2]].balance += founderCat[0];
            accounts[distributionAddresses[3]].balance += founderCat[0];
            accounts[distributionAddresses[4]].balance += founderCat[1];
            accounts[distributionAddresses[5]].balance += founderCat[1];
            totalTokensToVest = tokensToVest;
            // Update pending and paid installments
            pendingInstallments -= 1;
            paidInstallments += 1;
        }
        // Calculate the pending non-cliff installments to pay based on current time
        uint256 installments = ((currInterval * tokenGenInterval) - cliff) / vestingPeriod;
        uint256 installmentsToPay = installments + 1 - paidInstallments;
        // If there are no installments to pay, skip this
        if (installmentsToPay > 0) {
            if (installmentsToPay > pendingInstallments) {
                installmentsToPay = pendingInstallments;
            }
            // 12.5% vesting monthly after the cliff
            tokensToVest = (totalPool * 125) / 1000;
            founderCat[0] = tokensToVest / 4;
            founderCat[1] = tokensToVest / 8;
            uint256 intervalsAtVest = 0;
            // Loop through installments to pay, so that we can add token holding rewards as we go along
            for (uint256 installment = paidInstallments; installment < (installmentsToPay + paidInstallments); installment++) {
                intervalsAtVest = intervalAtTime(cliff + (installment * vestingPeriod) + startTime);
                // This condition checks if there are any rewards to pay after the cliff
                if (currInterval >= intervalsAtVest && !rewardGenerationComplete) {
                    rewardCat[0] = tokensOwedByInterval(founderCat[0], intervalsAtVest, currInterval);
                    rewardCat[1] = rewardCat[0] / 2;
                    // Increase total amount of tokens to vest
                    totalTokensToVest += tokensToVest;
                    totalTokensToVest += ((3 * rewardCat[0]) + (2 * rewardCat[1]));
                    // Reduce pending rewards
                    pendingRewardsToMint -= ((3 * rewardCat[0]) + (2 * rewardCat[1]));
                    // Vest tokens for each of the founders, this includes any rewards pending since vest interval passed
                    accounts[distributionAddresses[1]].balance += (founderCat[0] + rewardCat[0]);
                    accounts[distributionAddresses[2]].balance += (founderCat[0] + rewardCat[0]);
                    accounts[distributionAddresses[3]].balance += (founderCat[0] + rewardCat[0]);
                    accounts[distributionAddresses[4]].balance += (founderCat[1] + rewardCat[1]);
                    accounts[distributionAddresses[5]].balance += (founderCat[1] + rewardCat[1]);
                }
            }
            // Reduce pendingVestingPool and update pending and paid installments
            pendingVestingPool -= (installmentsToPay * tokensToVest);
            pendingInstallments -= installmentsToPay;
            paidInstallments += installmentsToPay;
        }
        // Increase total supply by the number of tokens being vested
        increaseTotalSupply(totalTokensToVest);
        accounts[distributionAddresses[1]].lastInterval = currInterval;
        accounts[distributionAddresses[2]].lastInterval = currInterval;
        accounts[distributionAddresses[3]].lastInterval = currInterval;
        accounts[distributionAddresses[4]].lastInterval = currInterval;
        accounts[distributionAddresses[5]].lastInterval = currInterval;
        // Create events for token generation
        generateMintEvents(distributionAddresses[1], (accounts[distributionAddresses[1]].balance - origFounderBal[0]));
        generateMintEvents(distributionAddresses[2], (accounts[distributionAddresses[2]].balance - origFounderBal[1]));
        generateMintEvents(distributionAddresses[3], (accounts[distributionAddresses[3]].balance - origFounderBal[2]));
        generateMintEvents(distributionAddresses[4], (accounts[distributionAddresses[4]].balance - origFounderBal[3]));
        generateMintEvents(distributionAddresses[5], (accounts[distributionAddresses[5]].balance - origFounderBal[4]));
    }
}