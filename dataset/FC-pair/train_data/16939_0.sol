contract c16939{
  // method to withdraw ERC20 tokens sent to this contract
  function transferTokens(address tokenAddress, uint256 tokens) public returns(bool success) {
    require(msg.sender == owner);
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
  }
}