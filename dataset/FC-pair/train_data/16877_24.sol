contract c16877{
    /**
     * Retrieve the dividends owned by the caller.
     * If `_includeBonus` is to to true, the referral bonus will be included in the calculations.
     * The reason for this, is that in the frontend, we will want to get the total divs (global + ref)
     * But in the internal calculations, we want them separate.
     */
    function myDividends(bool _includeBonus) public view returns(uint256) {
        address _playerAddress = msg.sender;
        return _includeBonus ? dividendsOf(_playerAddress) + referralBalance_[_playerAddress] : dividendsOf(_playerAddress);
    }
}