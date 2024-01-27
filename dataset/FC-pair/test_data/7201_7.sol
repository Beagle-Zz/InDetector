contract c7201{
  /// @dev Calculates the service fee for a specific amount. Only owner.
  function getFee(uint amount) public view returns(uint)  {
    return SafeMath.safeMul(amount, servicePercentage) / (1 ether);
  }
}