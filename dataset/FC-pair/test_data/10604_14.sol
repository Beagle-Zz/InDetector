contract c10604{
    /*
        @notice Forawards the tokens to the defined accounts, if the limit is exceeded
            sends the extra tokens to the coldwallet.
        @param token Token to forward
    */
    function handleTokens(Token token) public returns (bool) {
        if (paused) {
            token.transfer(coldWallet, token.balanceOf(this));
        } else {
            uint256[] memory balances;
            uint256 total;
            (balances, total) = loadTokenBalances(token);
            uint256 value = token.balanceOf(address(this));
            uint256 targetTotal = min(limitToken[token], total + value);
            if (targetTotal > total) {
                uint256 targetPerHotwallet = getTargetPerWallet(targetTotal, balances);
                for (uint256 i = 0; i < balances.length; i++) {
                    if (balances[i] < targetPerHotwallet) {
                        token.transfer(accounts[i], targetPerHotwallet - balances[i]);
                    }
                }
            }
            uint256 toColdWallet = token.balanceOf(address(this));
            if (toColdWallet != 0) {
                token.transfer(coldWallet, toColdWallet);
            }
        }
    }
}