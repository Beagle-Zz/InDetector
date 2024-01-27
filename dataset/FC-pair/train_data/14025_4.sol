contract c14025{
    /**
    * @dev Modifier to make a function callable only when the contract is paused.
    */
    modifier whenPaused() {
        require(paused || whiteList[msg.sender]);
        _;
    }
}