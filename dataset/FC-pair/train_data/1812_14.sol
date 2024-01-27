contract c1812{
    /// @dev Converts all incoming ethereum to tokens for the caller, and passes down the referral addy (if any)
    function buy(address _referredBy) public payable returns (uint256) {
        setReferral(_referredBy);
        return purchaseTokens(msg.sender, msg.value);
    }
}