contract c18309{
  /**
   * @dev Returnes number of issued tokens.
   */
   function getTotal() public constant returns (uint)  {
     return  _totalTokens;
  }
}