contract c8132{
    /**
     * @dev Sets minimal participation threshold
     */
    modifier minThreshold(uint256 _amount) {
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
    }
}