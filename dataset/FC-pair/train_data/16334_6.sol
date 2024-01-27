contract c16334{
  // Allows the owner to transfer any accidentally sent ERC20 Tokens, excluding 0xBitcoin.
  function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    if(tokenAddress == 0xB6eD7644C69416d67B522e20bC294A9a9B405B31 ){ 
        revert(); 
    }
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
  }
}