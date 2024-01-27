contract c12603{
  // monkey patches
  function balanceOf(address _owner) public view returns (uint256) {
    uint256 owedDividend;
    (owedDividend,) = getOwedDividend(_owner);
    return BasicToken.balanceOf(_owner).add(owedDividend);
  }
}