contract c7345{
  // recommended fix for known attack on any ERC20
  function safeApprove( address _spender,
                        uint256 _currentValue,
                        uint256 _value ) public
                        returns (bool success) {
    // If current allowance for _spender is equal to _currentValue, then
    // overwrite it with _value and return true, otherwise return false.
    if (allowances_[msg.sender][_spender] == _currentValue)
      return approve(_spender, _value);
    return false;
  }
}