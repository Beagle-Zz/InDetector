contract c18787{
    /**
    * @dev Computes overall bonus based on time of contribution and amount of contribution. 
    * The total bonus is the sum of bonus by time and bonus by amount
    * @return tokens 
    */
    function computeTokens(uint256 _weiAmount) public constant returns(uint256) {
        if(_weiAmount < minWeiAmount){ 
            return 0;
        }
        uint256 tokens = _weiAmount.mul(rate.mul(computeTimeBonus(now))).div(BONUS_COEFF);
        uint256 bonus = tokens.mul(computeAmountBonus(_weiAmount)).div(BONUS_COEFF);
        return tokens.div(lockingRatio).add(bonus);
    }
}