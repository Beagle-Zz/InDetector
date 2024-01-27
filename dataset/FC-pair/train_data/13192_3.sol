contract c13192{
    /**
     * @dev Modifier to make a function callable
     *      only when the contract is locked.
     */
    modifier whenLocked() {
        require(locked);
        _;
    }
}