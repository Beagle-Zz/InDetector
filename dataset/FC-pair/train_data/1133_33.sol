contract c1133{
    /**
    * @notice Returns price - should throw if not valid
    */
    function getPrice() external view returns(uint256) {
        require(latestUpdate >= now - staleTime);
        return POLYUSD;
    }
}