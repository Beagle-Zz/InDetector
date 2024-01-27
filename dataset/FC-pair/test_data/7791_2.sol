contract c7791{
    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function transferAnyERC20Token(address tokenAddress, uint tokens) public ownerOnly returns (bool success) {
        return iERC20(tokenAddress).transfer(owner, tokens);
    }
}