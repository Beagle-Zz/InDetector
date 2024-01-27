contract c2290{
    /**
     * @notice Return the STO details
     */
    function getSTODetails() public view returns(uint256, uint256, uint256, uint256, uint256, uint256, uint256, bool) {
        return (
            startTime,
            endTime,
            cap,
            rate,
            fundsRaised,
            investorCount,
            tokensSold,
            (fundraiseType == FundraiseType.POLY)
        );
    }
}