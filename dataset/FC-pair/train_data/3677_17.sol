contract c3677{
    /// @dev Withdraws ETH to workshop address. Returns success.
    function withdrawForWorkshop()
        public
        timedTransitions
        atStage(Stages.EndedAndGoalReached)
        returns (bool)
    {
        uint value = fundBalance;
        fundBalance = 0;
        require(value > 0);
        uint networkFee = value * SingularDTVWorkshopFee / 100;
        workshop.transfer(value - networkFee);
        SingularDTVWorkshop.transfer(networkFee);
        uint remainingTokens = CAP - tokensSent;
        if (remainingTokens > 0 && !singularDTVToken.transfer(owner, remainingTokens)) {
            revert();
        }
        checkInvariants();
        return true;
    }
}