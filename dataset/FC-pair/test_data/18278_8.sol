contract c18278{
    /**
     * @dev Process crowdsale contribution
     */
    function processContribution(address contributor) external payable onlyCrowdsale {
        require(state == FundState.Crowdsale);
        uint256 totalContribution = safeAdd(contributions[contributor], msg.value);
        contributions[contributor] = totalContribution;
    }
}