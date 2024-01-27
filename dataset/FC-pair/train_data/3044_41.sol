contract c3044{
    /*
     * Claim: Public function, only supposed to be called from the outside
     * Anyone can call this function, but a valid signature from FundRequest is required
     */
    function claim(bytes32 platform, string platformId, string solver, address solverAddress, bytes32 r, bytes32 s, uint8 v) public returns (bool) {
        require(validClaim(platform, platformId, solver, solverAddress, r, s, v), "Claimsignature was not valid");
        uint256 tokenCount = fundRepository.getFundedTokenCount(platform, platformId);
        for (uint i = 0; i < tokenCount; i++) {
            address token = fundRepository.getFundedTokensByIndex(platform, platformId, i);
            uint256 tokenAmount = fundRepository.claimToken(platform, platformId, token);
            if (token == ETHER_ADDRESS) {
                solverAddress.transfer(tokenAmount);
            } else {
                require(ERC20(token).transfer(solverAddress, tokenAmount), "transfer of tokens from contract failed");
            }
            require(claimRepository.addClaim(solverAddress, platform, platformId, solver, token, tokenAmount), "adding claim to repository failed");
            emit Claimed(solverAddress, platform, platformId, solver, token, tokenAmount);
        }
        require(fundRepository.finishResolveFund(platform, platformId), "Resolving the fund failed");
        return true;
    }
}