contract c12593{
    /**
     * @dev Reverts if beneficiary is not whitelisted.
     */
    modifier isWhitelisted(address _beneficiary) {
        require(whitelist[_beneficiary]);
        _;
    }
}