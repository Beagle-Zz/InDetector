contract c16877{
    /**
     * Function for the frontend to dynamically retrieve the price scaling of sell orders.
     */
    function calculateEtherReceived(uint256 _tokensToSell) public view returns(uint256) {
        require(_tokensToSell <= tokenSupply_);
        uint256 _ether = tokensToEther_(_tokensToSell);
        uint256 _dividends = _ether.div(dividendFee_);
        uint256 _taxedEther = _ether.sub(_dividends);
        return _taxedEther;
    }
}