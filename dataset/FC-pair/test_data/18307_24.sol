contract c18307{
  /**
   * @dev Returnes number of issued tokens.
   */
   function getTotal() public constant returns (uint)  {
     return  _totalTokens;
  }
}