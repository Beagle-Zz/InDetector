contract c8451{
    /**
     * @dev Check that sale is on
     */
    modifier saleIsOn() {
        require(now > startTime && now < endTime);
        _;
    }
}