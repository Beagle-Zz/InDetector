contract c16511{
    /**
      * @dev Returen whether the beneficiary is whitelisted.
      */
    function isWhitelisted(address _beneficiary) external view onlyOwnerOrAdmin returns (bool) {
        return whitelist[_beneficiary];
    }
}