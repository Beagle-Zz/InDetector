contract c18923{
    /**
    * @dev Must be called after crowdsale ends, to do some extra finalization
    * work. Calls the contract's finalization function.
    */
    function finalize() public onlyOwner {
        require(!isFinalized);
        require(getNow() > icoEndTime || token.totalSupply() == ICO_TOKENS);
        if (goalReached()) {
            // Close escrowVault and transfer all collected ethers into WALLET address
            if (vault.state() != EscrowVault.State.Closed) {
                vault.close();
            }
            uint256 totalSupply = token.totalSupply();
            teamTimelock = new TokenTimelock(token, TEAM_WALLET, getNow().add(TEAM_TOKENS_LOCK_PERIOD));
            token.mint(teamTimelock, uint256(TEAM_TOKENS_PERCENT).mul(totalSupply).div(ICO_TOKENS_PERCENT));
            companyTimelock = new TokenTimelock(token, COMPANY_WALLET, getNow().add(COMPANY_TOKENS_LOCK_PERIOD));
            token.mint(companyTimelock, uint256(COMPANY_TOKENS_PERCENT).mul(totalSupply).div(ICO_TOKENS_PERCENT));
            token.mint(AIRDROP_WALLET, uint256(AIRDROP_TOKENS_PERCENT).mul(totalSupply).div(ICO_TOKENS_PERCENT));
            token.mint(JACKPOT_WALLET, uint256(JACKPOT_TOKENS_PERCENT).mul(totalSupply).div(ICO_TOKENS_PERCENT));
            token.finishMinting();
            token.transferOwnership(token);
        } else {
            vault.enableRefunds();
        }
        Finalized();
        isFinalized = true;
    }
}