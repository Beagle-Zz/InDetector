contract c10638{
    /**
     * @dev Check is valid msg value
     */
    modifier isValidBet(uint8 reward) {
        require(msg.value == Math.percent(betPrice, reward));
        _;
    }
}