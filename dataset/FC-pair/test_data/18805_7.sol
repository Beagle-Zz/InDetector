contract c18805{
    /**
     * Precautionary measures in case we need to adjust the masternode rate.
     */
    function setStakingRequirement(uint256 _amountOfTokens)
        onlyAdmin()
        public
    {
        stakingRequirement = _amountOfTokens;
    }
}