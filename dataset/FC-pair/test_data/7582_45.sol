contract c7582{
    /**
     * @notice Set what portion of voting havvens need to be in the affirmative
     * to allow it to pass.
     */
    function setRequiredMajority(uint fraction)
        external
        onlyOwner
    {
        require(MIN_REQUIRED_MAJORITY <= fraction);
        requiredMajority = fraction;
    }
}