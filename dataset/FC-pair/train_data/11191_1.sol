contract c11191{
    /**
     * @dev Check bank not empty (empty is < betPrice eth)
     */
    modifier bankNotEmpty() {
        require(bank >= Math.percent(betPrice, rewardTwo));
        require(address(this).balance >= bank);
        _;
    }
}