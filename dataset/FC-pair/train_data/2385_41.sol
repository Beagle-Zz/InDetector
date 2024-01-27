contract c2385{
    /**
     * @dev Only allow the owner to set the state.
     */
    function setState(uint256 _state) onlyOwner public {
        state = SaleState(_state);
        // Update cap when state changes
        tokenCap = getCurrentTierHardcap();
        if (state == SaleState.Closed) {
            crowdsaleClosed();
        }
    }
}