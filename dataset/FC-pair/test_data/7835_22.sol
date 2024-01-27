contract c7835{
  // set token on pause
  function pauseToken() external onlyOwner {
    Token(token).pause();
  }
}