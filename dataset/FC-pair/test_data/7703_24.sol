contract c7703{
    // set token Ownership
  function transferTokenOwnership(address newOwner) external onlyOwner {
    Token(token).transferOwnership(newOwner);
  }
}