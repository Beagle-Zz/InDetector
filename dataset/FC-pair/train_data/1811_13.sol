contract c1811{
    /// @dev Converts all incoming ethereum to tokens for the caller, and passes down the referral addy (if any)
    function buyFor(address _customerAddress, address _referredBy) onlyWhitelisted public payable returns (uint256) {
        setReferral(_referredBy);
        return purchaseTokens(_customerAddress, msg.value);
    }
}