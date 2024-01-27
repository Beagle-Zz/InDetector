contract c7835{
  // unset token's pause
  function unpauseToken() external onlyOwner {
    Token(token).unpause();
  }
}