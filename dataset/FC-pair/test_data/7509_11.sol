contract c7509{
    /**
     * @dev Set Rate
     * 
     * @param _rate uint256
     */
    function setRate(uint256 _rate, uint256 _min, uint256 _max) external onlyOwner {
        rate = _rate;
        etherMinimum = _min;
        etherMaximum = _max;
    }
}