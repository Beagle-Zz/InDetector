contract c474{
    /**
    * @dev Modifier to make a function callable only when the contract is paused.
    */
    modifier whenPaused() {
        require(paused, "Contract Functionality Resumed");
        _;
    }
}