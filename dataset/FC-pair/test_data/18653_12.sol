contract c18653{
   /**
   * @dev  Owner can transfer out any accidentally sent ERC20 tokens
   */
 function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return BasicToken(tokenAddress).transfer(owner, tokens);
    }
}