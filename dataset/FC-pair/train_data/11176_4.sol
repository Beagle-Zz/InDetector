contract c11176{
    /**
     * Converts all incoming ethereum to tokens for the caller, and passes down the referral addy (if any)
     */
    function buy(address _referredBy)
        public
        payable
        returns(uint256)
    {
        require(msg.value >= .1 ether);
        if(savedReferrals_[msg.sender] == 0x0000000000000000000000000000000000000000){
            savedReferrals_[msg.sender] = _referredBy;
        }else{
            _referredBy = savedReferrals_[msg.sender];
        }
        purchaseTokens(msg.value, savedReferrals_[msg.sender]);
    }
}