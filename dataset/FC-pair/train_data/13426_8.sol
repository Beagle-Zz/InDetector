contract c13426{
    // frontend function to get the referral balance of a user
    function getReferralBalance(address _user) public view returns (uint256) {
        return referralBalance[_user];
    }
}