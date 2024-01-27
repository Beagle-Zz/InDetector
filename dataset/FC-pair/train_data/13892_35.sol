contract c13892{
    /**
     * @dev Source of tokens. Override this method to modify the way in which 
     *      the crowdsale ultimately gets and sends its tokens.
     * @param _beneficiary Address performing the token purchase
     * @param _tokenAmount Number of tokens to be emitted
     */
    function _deliverTokens(address _beneficiary, uint256 _tokenAmount, TokenLockType lockType) internal {
        if (lockType == TokenLockType.TYPE_NOT_LOCK) {
            _mint(_beneficiary, _tokenAmount);
        } else if (lockType == TokenLockType.TYPE_SEED_INVESTOR) {
            //seed insvestor will be locked for 6 months and then unlocked at one time
            _mintTimelocked(_beneficiary, _tokenAmount, now + 6 * 30 days);
        } else if (lockType == TokenLockType.TYPE_PRE_SALE) {
            //Pre-sale will be locked for 6 months and unlocked in 3 times(every 2 months)
            uint256 amount1 = _tokenAmount.mul(30).div(100);    //first unlock 30%
            uint256 amount2 = _tokenAmount.mul(30).div(100);    //second unlock 30%
            uint256 amount3 = _tokenAmount.sub(amount1).sub(amount2);   //third unlock 50%
            uint256 releaseTime1 = now + 2 * 30 days;
            uint256 releaseTime2 = now + 4 * 30 days;
            uint256 releaseTime3 = now + 6 * 30 days;
            _mintTimelocked(_beneficiary, amount1, releaseTime1);
            _mintTimelocked(_beneficiary, amount2, releaseTime2);
            _mintTimelocked(_beneficiary, amount3, releaseTime3);
        }
    }
}