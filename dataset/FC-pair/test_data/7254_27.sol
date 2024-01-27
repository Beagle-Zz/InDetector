contract c7254{
    /**
     * @dev Must be called after crowdsale ends, to do some extra finalization
     * work. Calls the contract's finalization function.
     */
    function finalize() onlyOwner public {
        require(!isFinalized);
        finalization();
        Finalized();
        isFinalized = true;
    }
}