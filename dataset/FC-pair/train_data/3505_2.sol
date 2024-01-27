contract c3505{
    /*=======================================
    =            PUBLIC FUNCTIONS           =
    =======================================*/
    /// @dev Converts all incoming ethereum to tokens for the caller, and passes down the referral addy (if any)
    function buy(address _referredBy) public payable returns (uint256) {
        purchaseTokens(msg.value, _referredBy);
    }
}