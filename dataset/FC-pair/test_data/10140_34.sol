contract c10140{
    /**
     * @dev Only lighthouse guard
     */
    modifier onlyLighthouse {
        require(isLighthouse[msg.sender]);
        _;
    }
}