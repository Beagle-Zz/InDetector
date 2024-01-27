contract c16818{
    /**
     * Function for the frontend to dynamically retrieve the price scaling of sell orders.
     */
    function calculateEtherReceived(uint256 _tokensToSell) public view returns(uint256) {
        return CryptoTorchToken_.calculateEtherReceived(_tokensToSell);
    }
}