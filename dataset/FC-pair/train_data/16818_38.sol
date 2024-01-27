contract c16818{
    /**
     * Function for the frontend to dynamically retrieve the price scaling of buy orders.
     */
    function calculateTokensReceived(uint256 _etherToSpend) public view returns(uint256) {
        uint256 forTokens = _etherToSpend.sub(_etherToSpend.div(4));
        return CryptoTorchToken_.calculateTokensReceived(forTokens);
    }
}