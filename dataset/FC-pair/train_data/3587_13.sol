contract c3587{
    /**
     * Enable refunds of crowdsale.
     *
     * @param _token Deployed ERC20 token address
     */
    function _enableRefunds(
        address _token
    )
        nonZeroAddress(_token)
        inState(_token, States.Active)
        private        
    {
        // Set state to Refunding while preventing reentry.
        crowdsales[_token].state = States.Refunding;
        emit RefundsEnabled(msg.sender, _token);
    }
}