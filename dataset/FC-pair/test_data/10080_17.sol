contract c10080{
    // MARK: Private functions
    function takeDividends(address _user) private {
        uint256 userAmount = getDividendAmount(_user);
        m_userHistories[_user].lastD_n = m_D_n;
        if (userAmount == 0) {
            return;
        }
        m_dividendBalances[_user] = m_dividendBalances[_user].add(userAmount);
        m_sharedDividendBalance = m_sharedDividendBalance.sub(userAmount);
    }
}