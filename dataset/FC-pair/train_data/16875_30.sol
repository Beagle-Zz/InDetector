contract c16875{
    /**
     * Retrieve the total token supply.
     */
    function totalSupply() public view returns(uint256) {
        return CryptoTorchToken_.totalSupply();
    }
}