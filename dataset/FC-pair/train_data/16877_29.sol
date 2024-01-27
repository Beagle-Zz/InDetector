contract c16877{
    /**
     * Retrieve the referral dividends balance of any single address.
     */
    function referralBalanceOf(address _playerAddress) public view returns(uint256) {
        return referralBalance_[_playerAddress];
    }
}