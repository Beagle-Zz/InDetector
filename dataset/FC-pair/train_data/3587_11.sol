contract c3587{
    /**
     * Pay commission by raised Wei amount of crowdsale.
     *
     * @param _token Deployed ERC20 token address
     */
    function _payCommission(
        address _token
    )
        nonZeroAddress(_token)
        inState(_token, States.Closed)
        onlyCrowdsaleOwner(_token)
        private
    {
        // Calculate commission, update rest raised Wei, and pay commission.
        uint256 _commission = crowdsales[_token].raised
            .mul(uint256(crowdsales[_token].commission))
            .div(100);
        crowdsales[_token].raised = crowdsales[_token].raised.sub(_commission);
        emit CommissionPaid(msg.sender, _token, commissionWallet, _commission);
        commissionWallet.transfer(_commission);
    }
}