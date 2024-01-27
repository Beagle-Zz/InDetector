contract c8716{
  /**
   * @dev Returns a bytes4 of keccak256 of json schema representing 0xcert protocol convention.
   */
  function conventionId()
    external
    view
    returns (bytes4 _conventionId)
  {
    _conventionId = nftConventionId;
  }
}