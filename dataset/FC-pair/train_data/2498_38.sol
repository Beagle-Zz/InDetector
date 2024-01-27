contract c2498{
    /**
     * @notice Return POLY raised by the STO
     */
    function getRaisedPOLY() public view returns (uint256) {
        if (fundraiseType == FundraiseType.POLY)
            return fundsRaised;
        else
            return 0;
    }
}