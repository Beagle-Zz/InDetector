contract c10636{
    /**
     * @dev Must be called after crowdsale ends, to do some extra finalization
     * work. Calls the contract's close function.
     */
    function closeCrowdsale() onlyOwner onlyOpenCrowdsale public {
        close();
        emit Closed();
        isClosed = true;
    }
}