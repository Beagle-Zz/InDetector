contract c2498{
    /**
     * @notice Return ETH raised by the STO
     */
    function getRaisedEther() public view returns (uint256) {
        if (fundraiseType == FundraiseType.ETH)
            return fundsRaised;
        else
            return 0;
    }
}