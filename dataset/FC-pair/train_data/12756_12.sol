contract c12756{
    /**
     * @dev Modifier to make a function callable
     *      only by exchange contract
     */
    modifier onlyExchange() {
        require(msg.sender == address(exchange));
        _;
    }
}