contract c2500{
    /**
     * @notice unpause registration function
     */
    function pause() public onlyOwner {
        _pause();
    }
}