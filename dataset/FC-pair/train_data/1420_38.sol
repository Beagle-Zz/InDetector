contract c1420{
    /**
    * @notice Increase total supply by `_val`
    * @param _val Value to increase
    * @return Operation status
    */
    function incTotalSupply(uint _val) external onlyOwner returns (bool) {
        totalSupply = totalSupply.add(_val);
        return true;
    }
}