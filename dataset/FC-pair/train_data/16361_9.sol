contract c16361{
    /**
     * @dev Start genesis
     */
    function start() external onlyOwner atStage(Stages.GenesisAllocation) {
        // Mint the initial supply
        token.mint(this, initialSupply);
        stage = Stages.GenesisStart;
    }
}