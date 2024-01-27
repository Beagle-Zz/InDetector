contract c18277{
    /**
        @dev sales manager
    */
    function paymentController(address sender, uint256 value) internal
        returns (uint256)
    {
        uint256 bonusValue = countBonus(value);
        bool conf = confirmSell(bonusValue);
        uint256 result;
        if (conf) {
            result = bonusValue;
            sell(sender, bonusValue);
            if (now >= Crowd.endDate) {
                saleStat = false;
                emit CrowdSaleFinished(); // if time is up
            }
        }
        else {
            result = Crowd.tokens;
            sell(sender, Crowd.tokens); // sell tokens which has been accessible
            saleStat = false;
            emit CrowdSaleFinished();  // if tokens sold
        }
        return result;
    }
}