contract c3329{
    /**
     * @dev Overrides addToWhitelist from WhitelistedCrowdsale to use a dedicated address instead of Owner
     * @param _beneficiaries Addresses to be added to the whitelist
     */
    function addManyToWhitelist(address[] _beneficiaries) external onlyWhitelister {
        for (uint256 i = 0; i < _beneficiaries.length; i++) {
            whitelist[_beneficiaries[i]] = true;
            AddToWhitelist(_beneficiaries[i]);
        }
    }
}