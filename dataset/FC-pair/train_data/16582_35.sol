contract c16582{
    /** Calc how much tokens you can buy at current time. */
    function weiToTokens(uint _amountWei) public view returns (uint) {
        return _amountWei.mul(tokensPerWei(_amountWei));
    }
}