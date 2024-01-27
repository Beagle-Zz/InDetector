contract c2213{
    /**
     * @dev Set the maximum investment in wei
    */
    function changeMax(uint256 newMax) external onlyOwner {
        investmentUpperBounds = newMax;
        emit ChangeMax(investmentUpperBounds);
    }
}