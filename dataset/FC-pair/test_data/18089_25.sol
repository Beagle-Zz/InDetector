contract c18089{
    /**
     * @dev Set hard cap.
     * @param _hardCap - Hard cap value
     */
    function setHardCap(uint256 _hardCap) public onlyOwner {
        require(hardCap == 0);
        hardCap = _hardCap;
    }
}