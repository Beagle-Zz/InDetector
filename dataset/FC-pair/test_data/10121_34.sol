contract c10121{
    /**
     * @dev Only lighthouse guard
     */
    modifier onlyLighthouse {
        require(isLighthouse[msg.sender]);
        _;
    }
}