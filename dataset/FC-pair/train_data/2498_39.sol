contract c2498{
    /**
     * @notice Return the total no. of investors
     */
    function getNumberInvestors() public view returns (uint256) {
        return investorCount;
    }
}