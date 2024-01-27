contract c13425{
    // returns the user's accumulated dividends, including the referral earnings
    function getUserDividends(address _user) public view returns (uint256) {
        return ((uint256) ((int256)(earningsPerToken * tokenBalance[_user]) - payouts[_user]) / scaleFactor) + (referralBalance[_user]);
    }
}