contract c16048{
  //
  // Authorization getters
  //
  /**
   * @dev Query whether an address has been authorized to move any assets on behalf of someone else
   * @param operator the address that might be authorized
   * @param assetHolder the address that provided the authorization
   * @return bool true if the operator has been authorized to move any assets
   */
  function isApprovedForAll(address operator, address assetHolder)
    external view returns (bool)
  {
    return _isApprovedForAll(operator, assetHolder);
  }
}