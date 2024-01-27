contract c16524{
  /// @notice triggers token generaton for the recipient
  ///  can be called only from the token sale contract itself
  ///  side effect: increases the generated tokens counter 
  ///  CAUTION: we do not check campaign state and parameters assuming that's callee's task
  function do_grant_tokens(address _to, uint256 _nTokens) internal returns (bool){
    require( token.generate_token_for(_to, _nTokens) );
    tokensGenerated = tokensGenerated.add(_nTokens);
    return true;
  }
}