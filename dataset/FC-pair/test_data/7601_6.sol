contract c7601{
 // ------------------------------------------------------------------------
 // Owner can transfer out any accidentally sent ERC20 tokens 
 // ------------------------------------------------------------------------
 function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    //find actual balance of the contract
     uint tokenBalance = ERC20Interface(tokenAddress).balanceOf(this);
     if(!ERC20Interface(tokenAddress).transfer(owner, tokens)) revert();
     return true;
 }
}