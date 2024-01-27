contract c2755{
    /**
     * @dev Finalizes the fundraiser. Cannot be reversed.
     */
    function finalize() onlyOwner public {
        require(!isFinalized);
        require(hasEnded());
        finalization();
        emit Finalized();
        isFinalized = true;
    }
}