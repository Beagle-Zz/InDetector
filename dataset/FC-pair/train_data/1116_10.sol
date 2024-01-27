contract c1116{
    // ************************************************************************
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ************************************************************************
    function transferERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20(tokenAddress).transfer(owner, tokens);
    }
}