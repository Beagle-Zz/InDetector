contract c12756{
    /**
     * @dev Modifier to make a function callable
     *      only when the exchange contract is set.
     */
    modifier whenConfigured() {
        require(exchange != address(0));
        _;
    }
}