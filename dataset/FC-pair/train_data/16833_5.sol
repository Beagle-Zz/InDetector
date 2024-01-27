contract c16833{
    /**
     * @dev Modifier to make a function callable only when the contract is not paused. [Exception: crowdsale contract]
     */
    modifier whenNotPaused() {
        require(!paused || msg.sender == crowdsale);
        _;
    }
}