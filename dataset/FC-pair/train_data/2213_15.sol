contract c2213{
    /**
     * @dev Set the maximum investment in wei
    */
    function changeHardCap(uint256 newHardCap) external onlyOwner {
        hardcap = newHardCap;
        emit ChangeHardCap(hardcap);
    }
}