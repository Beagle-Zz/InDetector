contract c16048{
  /**
   * Internal function that moves an asset from one holder to another
   */
  /**
   * @dev Returns `true` if the contract implements `interfaceID` and `interfaceID` is not 0xffffffff, `false` otherwise
   * @param  _interfaceID The interface identifier, as specified in ERC-165
   */
  function supportsInterface(bytes4 _interfaceID) external view returns (bool) {
    if (_interfaceID == 0xffffffff) {
      return false;
    }
    return _interfaceID == 0x01ffc9a7 || _interfaceID == 0x80ac58cd;
  }
}