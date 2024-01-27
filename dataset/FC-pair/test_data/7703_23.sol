contract c7703{
  // unset token's pause
  function unpauseToken() external onlyOwner {
    Token(token).unpause();
  }
}