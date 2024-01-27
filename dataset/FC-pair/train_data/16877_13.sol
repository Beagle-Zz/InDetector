contract c16877{
    /**
     * Liquifies tokens to ether.
     */
    function mint(address _to, uint256 _amountPaid, address _referredBy) public onlyTokenController payable returns(uint256) {
        require(_amountPaid == msg.value);
        return mintTokens_(_to, _amountPaid, _referredBy);
    }
}