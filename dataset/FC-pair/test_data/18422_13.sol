contract c18422{
    // This method is only use for credit DSTToken to DST wallet L,M,N and O users
    // @dev Required state: is dstWalletLMNO set
    // @param claimAddress The address of the wallet user to credit tokens
    // @param token The number of DST tokens to credit
    // @return Whether the credit was successful or not
    function creditWalletUserLMNO(address claimAddress,uint256 token) external onlyDSTWalletLMNO returns (bool){
        // Check if DST wallet LMNO is set or not
        require(dstWalletLMNO != address(0));
        // Check claiment address and token is valid or not
        require(claimAddress != address(0) && token > 0);
        // Assign tokens to user
        balances[claimAddress] = safeAdd(balances[claimAddress], token);
        // balances[_walletAddress] = safeSub(balances[_walletAddress],token);
        return true;
    }
}