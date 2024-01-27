contract c2445{
    /**
     * @dev Finalize crowd-sale
     */
    function finalize() public onlyOwner {
        _finalize();
    }
}