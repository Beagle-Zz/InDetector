contract c3587{
    /**
     * Pause crowdsale, which will set the crowdsale state to Refunding.
     *
     * Note only pause crowdsales which are suspicious/scams.
     *
     * @param _token Deployed ERC20 token address
     */
    function pauseCrowdsale(
        address _token
    )        
        nonZeroAddress(_token)
        onlyOwner
        inState(_token, States.Active)
        external
    {
        emit CrowdsalePaused(msg.sender, _token);
        _enableRefunds(_token);
        _refundCrowdsaleTokens(ERC20(_token), crowdsales[_token].refundWallet);
    }
}