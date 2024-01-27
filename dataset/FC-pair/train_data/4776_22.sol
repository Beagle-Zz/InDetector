contract c4776{
   /**
    * @dev To transfer back any accidental ERC20 tokens sent to this contract by owner
    */
   function transferAnyERC20Token(address _tokenAddress, uint256 _tokens) onlyOwner public returns (bool success) 
   {
      require(!stopped);
      return ERC20Interface(_tokenAddress).transfer(owner, _tokens);
   }
}