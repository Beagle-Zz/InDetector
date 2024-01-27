contract c9377{
    /**
     * @dev Function to be fired by the initPGOMonthlyInternalVault function from the GotCrowdSale contract to set the
     * InternalVault's state after deployment.
     * @param beneficiaries Array of the internal investors addresses to whom vested tokens are transferred.
     * @param balances Array of token amount per beneficiary.
     * @param startTime Start time at which the first released will be executed, and from which the cliff for second
     * release is calculated.
     * @param _token The address of the GOT Token.
     */
    function init(address[] beneficiaries, uint256[] balances, uint256 startTime, address _token) public {
        // makes sure this function is only called once
        require(token == address(0));
        require(beneficiaries.length == balances.length);
        start = startTime;
        cliff = start.add(VESTING_CLIFF);
        end = start.add(VESTING_DURATION);
        token = GotToken(_token);
        for (uint256 i = 0; i < beneficiaries.length; i = i.add(1)) {
            investments[beneficiaries[i]] = Investment(beneficiaries[i], balances[i], 0);
        }
    }
}