contract c1420{
    /**
     * @notice Decrease total supply by `_val`
     * @param _val Value to decrease
     * @return Operation status
     */
    function decTotalSupply(uint _val) external onlyOwner returns (bool) {
        totalSupply = totalSupply.sub(_val);
        return true;
    }
}