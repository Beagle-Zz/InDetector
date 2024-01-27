contract c3329{
    /**
     * @dev Overrides addToWhitelist from WhitelistedCrowdsale to use a dedicated address instead of Owner
     * @param _beneficiary Address to be added to the whitelist
     */
    function addToWhitelist(address _beneficiary) external onlyWhitelister {
        whitelist[_beneficiary] = true;
        AddToWhitelist(_beneficiary);
    }
}