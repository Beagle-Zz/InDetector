contract c13764{
    /**
     * @dev Modifier to make a function callable only when the contract is not locked.
     */
    modifier whenNotLocked() {
        require(!locked);
        _;
    }
}