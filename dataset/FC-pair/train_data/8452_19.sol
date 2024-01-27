contract c8452{
    /**
     * @dev Tokens for team will be frozen for a period of 6 months after end ICO
     * Note: timestamp 1539169200 is equal 2018-10-10T11:00:00
     */
    modifier canTransfer (address sender) {
        if (sender == teamFund) {
            require(now > (1539169200 + 180 days));
        }
        _;
    }
}