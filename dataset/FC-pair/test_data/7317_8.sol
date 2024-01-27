contract c7317{
    /// @notice can be called only by admin
    /// @dev allow or prevent a specific reserve to trade a pair of tokens
    /// @param reserve The reserve address.
    /// @param token token address
    /// @param ethToToken will it support ether to token trade
    /// @param tokenToEth will it support token to ether trade
    /// @param add If true then list this pair, otherwise unlist it.
    function listPairForReserve(address reserve, ERC20 token, bool ethToToken, bool tokenToEth, bool add)
        public onlyAdmin
    {
        require(isReserve[reserve]);
        if (ethToToken) {
            listPairs(reserve, token, false, add);
            ListReservePairs(reserve, ETH_TOKEN_ADDRESS, token, add);
        }
        if (tokenToEth) {
            listPairs(reserve, token, true, add);
            if (add) {
                token.approve(reserve, 2**255); // approve infinity
            } else {
                token.approve(reserve, 0);
            }
            ListReservePairs(reserve, token, ETH_TOKEN_ADDRESS, add);
        }
        setDecimals(token);
    }
}