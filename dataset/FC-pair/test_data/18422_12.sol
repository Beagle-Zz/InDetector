contract c18422{
    // This method is only use for debit DSTToken from DST wallet L,M,N and O
    // @dev Required state: is dstWalletLMNO set
    // @param _walletAddress The address of the wallet from tokens debit
    // @param token The number of DST tokens to debit
    // @return Whether the debit was successful or not
    function debitWalletLMNO(address _walletAddress,uint256 token) external onlyDSTWalletLMNO returns (bool){
        // Check if DST wallet LMNO is set or not
        require(dstWalletLMNO != address(0));
        // Check wallet have enough token and token is valid
        require(balances[_walletAddress] >= token && token > 0);
        // Increasing the totalSupply
        totalSupply = safeAdd(totalSupply, token);
        // Debit tokens from wallet balance
        balances[_walletAddress] = safeSub(balances[_walletAddress],token);
        return true;
    }
}