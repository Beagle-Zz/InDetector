contract c8132{
    /**
     * @dev Token purchase
     * @param _beneficiary Address performing the token purchase
     */
    function buyTokens(address _beneficiary)
        public
        payable
        onlyWhileActive
        minThreshold(20 finney)
    {
        require(_beneficiary != address(0));
        uint256 newWeiRaised = msg.value;
        uint256 newTotalWeiRaised = totalWeiRaised.add(newWeiRaised);
        uint256 refundValue = 0;
        if (newTotalWeiRaised > CAP) {
            newWeiRaised = CAP.sub(totalWeiRaised);
            refundValue = newTotalWeiRaised.sub(CAP);
        }
        enroll(msg.sender, _beneficiary, newWeiRaised);
        if (refundValue > 0) {
            msg.sender.transfer(refundValue);
        }
    }
}