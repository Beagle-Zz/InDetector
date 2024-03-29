contract c18058{
    /**
     * @dev Finalize crowdsale if we reached hard cap or current time > SALE_END_TIME
     */
    function finalizeCrowdsale() public onlyOwner {
        if(
            (totalEtherContributed >= safeSub(hardCap, 20 ether) && totalBNBContributed >= safeSub(BNB_HARD_CAP, 10000 ether)) ||
            (now >= SALE_END_TIME && totalEtherContributed >= softCap)
        ) {
            fund.onCrowdsaleEnd();
            reservationFund.onCrowdsaleEnd();
            // BNB transfer
            bnbToken.transfer(bnbTokenWallet, bnbToken.balanceOf(address(this)));
            // Referral
            uint256 referralTokenAmount = safeDiv(rawTokenSupply, 10);
            token.issue(referralTokenWallet, referralTokenAmount);
            // Foundation
            uint256 foundationTokenAmount = safeDiv(token.totalSupply(), 2); // 20%
            lockedTokens.addTokens(foundationTokenWallet, foundationTokenAmount, now + 365 days);
            uint256 suppliedTokenAmount = token.totalSupply();
            // Reserve
            uint256 reservedTokenAmount = safeDiv(safeMul(suppliedTokenAmount, 3), 10); // 18%
            token.issue(address(lockedTokens), reservedTokenAmount);
            lockedTokens.addTokens(reserveTokenWallet, reservedTokenAmount, now + 183 days);
            // Advisors
            uint256 advisorsTokenAmount = safeDiv(suppliedTokenAmount, 10); // 6%
            token.issue(advisorsTokenWallet, advisorsTokenAmount);
            // Company
            uint256 companyTokenAmount = safeDiv(suppliedTokenAmount, 4); // 15%
            token.issue(address(lockedTokens), companyTokenAmount);
            lockedTokens.addTokens(companyTokenWallet, companyTokenAmount, now + 730 days);
            // Bounty
            uint256 bountyTokenAmount = safeDiv(suppliedTokenAmount, 60); // 1%
            token.issue(bountyTokenWallet, bountyTokenAmount);
            token.setAllowTransfers(true);
        } else if(now >= SALE_END_TIME) {
            // Enable fund`s crowdsale refund if soft cap is not reached
            fund.enableCrowdsaleRefund();
            reservationFund.onCrowdsaleEnd();
            bnbRefundEnabled = true;
        }
        token.finishIssuance();
    }
}