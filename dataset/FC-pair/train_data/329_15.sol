contract c329{
  /**
   * @notice Add an address to an existing id 
   * @dev Checks that new address signed _sig 
   * @param _newAddress Address to add to account
   * @param _newAddressSig Signed message from new address confirming ownership by the sender
   * @param _senderSig Signed message from new address confirming ownership by the sender
   * @param _sender User requesting this action
   * @param _nonce uuid used when generating sigs to make them one time use
   */
  function addAddressToAccountForUser(
    address _newAddress,
    bytes _newAddressSig,
    bytes _senderSig,
    address _sender,
    bytes32 _nonce
    ) private nonZero(_newAddress) {
    require(!usedSignatures[keccak256(abi.encodePacked(_newAddressSig))], "Signature not unique");
    require(!usedSignatures[keccak256(abi.encodePacked(_senderSig))], "Signature not unique");
    usedSignatures[keccak256(abi.encodePacked(_newAddressSig))] = true;
    usedSignatures[keccak256(abi.encodePacked(_senderSig))] = true;
    // Confirm new address is signed by current address
    bytes32 _currentAddressDigest = signingLogic.generateAddAddressSchemaHash(_newAddress, _nonce);
    require(_sender == signingLogic.recoverSigner(_currentAddressDigest, _senderSig));
    // Confirm current address is signed by new address
    bytes32 _newAddressDigest = signingLogic.generateAddAddressSchemaHash(_sender, _nonce);
    require(_newAddress == signingLogic.recoverSigner(_newAddressDigest, _newAddressSig));
    registry.addAddressToAccount(_newAddress, _sender);
    uint256 _accountId = registry.accountIdForAddress(_newAddress);
    emit AddressAdded(_accountId, _newAddress);
  }
}