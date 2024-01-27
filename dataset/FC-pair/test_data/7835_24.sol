contract c7835{
    // set token Ownership
  function transferTokenOwnership(address newOwner) external onlyOwner {
    Token(token).transferOwnership(newOwner);
  }
}