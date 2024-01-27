contract c13293{
    /**
     * @dev Must be called after crowdsale ends, to do some extra finalization
     * work. Calls the contract's finalization function.
     */
    function finalize() external onlyOwner {
        require(!isFinalized);
        require(hasClosed());
        require(!preAllocationsPending);
        finalization();
        emit Finalized();
        isFinalized = true;
    }
}