contract c3587{
    /**
     * Claim token, which will transfer bought token amount to buyer.
     *
     * @param _token Deployed ERC20 token address
     */
    function claimToken(
        address _token
    )
        nonZeroAddress(_token)
        inState(_token, States.Closed)        
        external 
    {
        require(
            deposits[msg.sender][_token] > 0,
            "Failed to claim token due to deposit is 0."
        );
        // Calculate token unit amount to be transferred. 
        uint256 _value = (
            deposits[msg.sender][_token].mul(crowdsales[_token].rate)
        );
        deposits[msg.sender][_token] = 0;
        emit TokenClaimed(msg.sender, _token, _value);
        ERC20(_token).transfer(msg.sender, _value);
    }
}