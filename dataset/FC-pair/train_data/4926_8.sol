contract c4926{
    /**
     * @dev Must be called after crowdsale ends, to do some extra finalization
     * work. Calls the contract's finalization function.
     */
    function lock() onlyOwner public {
        require(!isLocked);
        emit Locked();
        isLocked = true;
    }
}