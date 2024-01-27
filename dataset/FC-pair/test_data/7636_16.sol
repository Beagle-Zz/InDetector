contract c7636{
  /**
    * @notice Withdraw available tokens
    * 
    */
  function withdrawTokens() public {
    distributeTokens(msg.sender);
  }
}