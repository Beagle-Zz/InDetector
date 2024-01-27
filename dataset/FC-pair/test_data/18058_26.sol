contract c18058{
    /**
     * @dev Set soft cap.
     * @param _softCap - Soft cap value
     */
    function setSoftCap(uint256 _softCap) public onlyOwner {
        require(softCap == 0);
        softCap = _softCap;
    }
}