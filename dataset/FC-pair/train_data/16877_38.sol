contract c16877{
    /**
     * Retrieve the dividends of the owner.
     */
    function getDividendsOf_(address _recipient, bool _includeBonus) internal view returns(uint256) {
        return _includeBonus ? dividendsOf(_recipient) + referralBalance_[_recipient] : dividendsOf(_recipient);
    }
}