contract c4166{
  /**
    * @dev Checks if the smart contract includes a specific interface.
    * @param _interfaceID The interface identifier, as specified in ERC-165.
    */
  function supportsInterface(bytes4 _interfaceID) public pure returns (bool) {
    return super.supportsInterface(_interfaceID) || _interfaceID == INTERFACE_ERC721_ENUMERABLE || _interfaceID == INTERFACE_ERC721_METADATA;
  }
}