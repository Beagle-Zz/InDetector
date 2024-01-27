contract c18719{
  // Implements funding state criterion
  function isCrowdsaleFull() internal view returns (bool full) {
    return tokensSold >= sellable_tokens;
  }
}