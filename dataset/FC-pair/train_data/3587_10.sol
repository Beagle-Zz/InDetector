contract c3587{
    /**
     * Check whether crowdsale goal was reached or not.
     *
     * Goal reached condition:
     * 1. total raised wei >= goal (soft cap); and
     * 2. Right amout of token is prepared for this contract.
     *
     * @param _token Deployed ERC20 token
     * @return Whether crowdsale goal was reached or not
     */
    function _goalReached(
        ERC20 _token
    )
        nonZeroAddress(_token)
        private
        view
        returns(bool) 
    {
        return (crowdsales[_token].raised >= crowdsales[_token].goal) && (
            _token.balanceOf(address(this)) >= 
            crowdsales[_token].raised.mul(crowdsales[_token].rate)
        );
    }
}