contract c16875{
    /**
     * Return the sell price of 1 individual token.
     */
    function sellPrice() public view returns(uint256) {
        return CryptoTorchToken_.sellPrice();
    }
}