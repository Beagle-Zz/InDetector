contract c4370{
  /// @dev Checks if transfer parameters are valid
  function isTransferValid(address _from, address _to, uint256 _amount)
      private
      constant
      returns (bool isValid)
  {
    return  balances[_from] >= _amount &&  // sufficient balance
            _amount > 0 &&                 // amount is positive
            _to != address(this) &&        // prevent sending tokens to contract
            _to != 0x0                     // prevent sending token to 0x0 address
    ;
  }
}