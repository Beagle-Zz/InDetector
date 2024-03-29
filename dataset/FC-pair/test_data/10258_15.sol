contract c10258{
    /**
    * @dev Modifier to make a function callable only when the contract is not paused.
    */
    modifier whenNotPaused() {
        require(!paused || msg.sender == owner);
        _;
    }
}