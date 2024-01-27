contract c7832{
  // set token on pause
  function pauseToken() external onlyOwner {
    Token(token).pause();
  }
}