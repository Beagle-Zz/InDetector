contract c3587{
    /**
     * Finalize a crowdsale.
     *
     * Once a crowdsale is finalized, its state could be
     * either Closed (success) or Refunding (fail).
     *
     * @param _token Deployed ERC20 token address
     */
    function finalize(
        address _token
    )
        nonZeroAddress(_token)
        inState(_token, States.Active)        
        onlyCrowdsaleOwner(_token)
        external
    {
        require(                    
            crowdsales[_token].earlyClosure || (
            // solium-disable-next-line security/no-block-members
            block.timestamp >= crowdsales[_token].closingTime),                   
            "Failed to finalize due to crowdsale is opening."
        );
        if (_goalReached(ERC20(_token))) {
            // Set state to Closed whiling preventing reentry.
            crowdsales[_token].state = States.Closed;
            emit CrowdsaleClosed(msg.sender, _token);
            _payCommission(_token);                        
        } else {
            _enableRefunds(_token);
            _refundCrowdsaleTokens(
                ERC20(_token), 
                crowdsales[_token].refundWallet
            );
        }
    }
}