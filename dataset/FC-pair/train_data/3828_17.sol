contract c3828{
 // ------------------------------------------------------------------------
 // Owner can transfer out any accidentally sent ERC20 tokens
 // Owner CANNOT transfer out tokens which were purposefully deposited
 // ------------------------------------------------------------------------
 function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    //find actual balance of the contract
     uint tokenBalance = ERC20Interface(tokenAddress).balanceOf(this);
     //find number of accidentally deposited tokens (actual - purposefully deposited)
     uint undepositedTokens = tokenBalance.sub(depositedTokens[tokenAddress]);
     //only allow withdrawing of accidentally deposited tokens
     assert(tokens <= undepositedTokens);
     if(!ERC20Interface(tokenAddress).transfer(owner, tokens)) revert();
     return true;
 }
}