contract c8903{
    /**
    * @dev Modifier to make a function callable only when the contract is paused.
    */
    modifier whenPaused() {
        require(paused || msg.sender == owner);
        _;
    }
}