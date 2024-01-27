contract c12314{
    // Owner can transfer out any ERC20 tokens sent in by mistake
    function transferAnyERC20Token(address tokenAddress, uint amount) public onlyOwner returns (bool success)
    {
        return ERC20(tokenAddress).transfer(owner, amount);
    }
}