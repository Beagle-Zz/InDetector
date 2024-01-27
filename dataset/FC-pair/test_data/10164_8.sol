contract c10164{
    // Owner functions ------------------------------------
    function updateTokensPerEth(uint _tokens_per_eth) public onlyOwner {
        require(now < dateMainStart);
        tokensPerEth = _tokens_per_eth;
        emit UpdatedTokensPerEth(tokensPerEth);
    }
}