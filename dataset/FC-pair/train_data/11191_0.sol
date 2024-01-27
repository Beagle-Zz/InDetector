contract c11191{
    /**
     * @dev Check is valid msg value
     */
    modifier isValidBet(uint8 reward) {
        require(msg.value == Math.percent(betPrice, reward));
        _;
    }
}