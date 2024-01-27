contract c12223{
    /**
        @dev Release one  tranche of the ecosystemSupply allocation to Goola ecosystem,6.25% every tranche.About 4 years ecosystemSupply release over.
        @return true if successful, throws if not
    */
    function releaseForEcosystem()   public ownerOnly  returns(bool success) {
        require(now >= createTime + 12 weeks);
        require(tokensReleasedToEcosystem < ecosystemSupply);
        uint256 temp = ecosystemSupply / 10000;
        uint256 allocAmount = safeMul(temp, 625);
        uint256 currentTranche = uint256(now - createTime) /  12 weeks;
        if(ecosystemTranchesReleased < maxTranches && currentTranche > ecosystemTranchesReleased && (currentSupply + allocAmount) <= totalSupply) {
            ecosystemTranchesReleased++;
            balanceOf[ecosystemAddress] = safeAdd(balanceOf[ecosystemAddress], allocAmount);
            currentSupply += allocAmount;
            tokensReleasedToEcosystem = safeAdd(tokensReleasedToEcosystem, allocAmount);
            Transfer(0x0, ecosystemAddress, allocAmount);
            return true;
        }
        revert();
    }
}