contract c18278{
    /**
     * @dev Decrease tap amount
     * @param _tap New tap value
     */
    function decTap(uint256 _tap) external onlyOwner {
        require(state == FundState.TeamWithdraw);
        require(_tap < tap);
        tap = _tap;
    }
}