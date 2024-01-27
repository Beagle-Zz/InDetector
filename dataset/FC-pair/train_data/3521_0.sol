contract c3521{
  /**
   * @dev Checks if the smart contract includes a specific interface.
   * @param _interfaceID The interface identifier, as specified in ERC-165.
   */
  function supportsInterface(bytes4 _interfaceID) public pure returns (bool) {
    return _interfaceID == INTERFACE_ERC165;
  }
}