contract c2498{
    /**
     * @notice pause (overridden function)
     */
    function pause() public onlyOwner {
        require(now < endTime);
        super._pause();
    }
}