contract c2501{
    /**
     * @notice Change the expiry time for the token symbol
     * @param _newExpiry new time period for token symbol expiry
     */
    function changeExpiryLimit(uint256 _newExpiry) public onlyOwner {
        require(_newExpiry >= 1 days, "Expiry should greater than or equal to 1 day");
        uint256 _oldExpiry = expiryLimit;
        expiryLimit = _newExpiry;
        emit LogChangeExpiryLimit(_oldExpiry, _newExpiry);
    }
}