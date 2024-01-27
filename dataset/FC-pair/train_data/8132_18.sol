contract c8132{
    /**
     * @dev common logic for enroll funds
     */
    function enroll(address _purchaser, address _beneficiary, uint256 _value) private {
        // update sale progress
        totalWeiRaised = totalWeiRaised.add(_value);
        // calculate token amount
        uint256 tokenAmount = getTokenAmount(_value);
        require(token.transfer(_beneficiary, tokenAmount));
        emit TokenPurchase(_purchaser, _beneficiary, _value, tokenAmount);
    }
}