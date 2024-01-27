contract c11119{
      /**
    * @dev Computes overall bonus based on time of contribution and amount of contribution.
    * The total bonus is the sum of bonus by time and bonus by amount
    * @return tokens
    */
    function computeTokens(uint256 _weiAmount) public constant returns(uint256) {
        uint256 tokens = _weiAmount.mul(getRate());
        uint256 crowNums = CROWDSALE_TOKENS_NUMS;
        uint256 totolCrowd_ = token.totalCrowdSale();
        uint256 leftNums = crowNums.sub(totolCrowd_);
        require(leftNums>=tokens);
        return tokens;
    }
}