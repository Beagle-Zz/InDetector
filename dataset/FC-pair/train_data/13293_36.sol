contract c13293{
    /**
     * @dev Extends crowdsale end date
     */
    function extendCrowdsale(uint256 _closingTime) external onlyOwner {
        require(_closingTime > closingTime);
        require(block.timestamp <= openingTime.add(36 weeks));
        closingTime = _closingTime;
    }
}