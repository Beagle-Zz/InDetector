contract c8358{
    /**
     * @dev Get all information about a specifc grant.
     * @param _holder The address which will have its tokens revoked.
     * @param _grantId The id of the token grant.
     * @return Returns all the values that represent a TokenGrant(address, value, start, cliff,
     * revokability, burnsOnRevoke, and vesting) plus the vested value at the current time.
     */
    function tokenGrant(address _holder, uint _grantId) public view 
        returns (address granter, uint256 value, uint256 vested, uint start, uint cliff, uint vesting, bool revokable, bool burnsOnRevoke, bool timeOrNumber) {
        TokenGrant storage grant = grants[_holder][_grantId];
        granter = grant.granter;
        value = grant.value;
        start = grant.start;
        cliff = grant.cliff;
        vesting = grant.vesting;
        revokable = grant.revokable;
        burnsOnRevoke = grant.burnsOnRevoke;
        timeOrNumber = grant.timeOrNumber;
        vested = vestedTokens(grant, now, block.number);
    }
}