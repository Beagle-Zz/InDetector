contract c16365{
    /*
     * @dev Set missed verification slash amount. Only callable by the controller owner
     * @param _missedVerificationSlashAmount % of stake slashed for missed verification
     */
    function setMissedVerificationSlashAmount(uint256 _missedVerificationSlashAmount) external onlyControllerOwner {
        // Must be a valid percentage
        require(MathUtils.validPerc(_missedVerificationSlashAmount));
        missedVerificationSlashAmount = _missedVerificationSlashAmount;
        ParameterUpdate("missedVerificationSlashAmount");
    }
}