contract c2644{
    /**
     * @dev sets boundaries for incoming tx
     */
    modifier isWithinLimits(uint256 _eth) {
        require(_eth >= 1000000000);
        require(_eth <= 100000000000000000000000);
        _;
    }
}