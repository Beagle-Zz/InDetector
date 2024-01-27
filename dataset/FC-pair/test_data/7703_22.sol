contract c7703{
  // set token on pause
  function pauseToken() external onlyOwner {
    Token(token).pause();
  }
}