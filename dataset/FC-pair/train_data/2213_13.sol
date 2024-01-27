contract c2213{
    /**
     * @dev Set the minimum investment in wei
    */
    function changeMin(uint256 newMin) external onlyOwner {
        minInvestment = newMin;
        emit ChangeMin(minInvestment);
    }
}