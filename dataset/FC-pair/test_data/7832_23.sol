contract c7832{
  // unset token's pause
  function unpauseToken() external onlyOwner {
    Token(token).unpause();
  }
}