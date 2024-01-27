contract c18999{
  /// @dev Remaining tokens third party spender has to send
  /// @param self Stored token from token contract
  /// @param _owner Address of token holder
  /// @param _spender Address of authorized spender
  /// @return remaining Number of tokens spender has left in owner's account
  function allowance(TokenStorage storage self, address _owner, address _spender)
                     public
                     view
                     returns (uint256 remaining) {
    return self.allowed[_owner][_spender];
  }
}