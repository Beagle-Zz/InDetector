contract c16637{
  // determines today's index.
  function today() private constant returns (uint) { return now / 1 days; }
}