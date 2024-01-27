contract c13661{
    /**
     * @dev Set Rate
     * 
     * @param _rate uint256
     */
    function setRate(uint256 _rate) external onlyOwner returns (bool) {
        rate = _rate;
        return true;
    }
}