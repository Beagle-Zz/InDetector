contract c16818{
    /**
     * Return the buy price of 1 individual token.
     */
    function buyPrice() public view returns(uint256) {
        return CryptoTorchToken_.buyPrice();
    }
}