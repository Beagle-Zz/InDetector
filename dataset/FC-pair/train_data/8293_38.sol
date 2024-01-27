contract c8293{
    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        require(frozen == false); 
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
}