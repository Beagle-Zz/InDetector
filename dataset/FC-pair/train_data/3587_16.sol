contract c3587{
    /**
     * Claim crowdsale raised Wei.
     *
     * @param _token Deployed ERC20 token address
     */
    function claimRaisedWei(
        address _token,
        address _beneficiary
    )
        nonZeroAddress(_token)
        nonZeroAddress(_beneficiary)
        inState(_token, States.Closed)
        onlyCrowdsaleOwner(_token)
        external
    {
        require(
            crowdsales[_token].raised > 0,
            "Failed to claim raised Wei due to raised Wei is 0."
        );
        uint256 _raisedWei = crowdsales[_token].raised;
        crowdsales[_token].raised = 0;
        emit RaisedWeiClaimed(msg.sender, _token, _raisedWei);
        _beneficiary.transfer(_raisedWei);
    }
}