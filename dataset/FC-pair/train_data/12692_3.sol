contract c12692{
  /// @dev Set an address at _key location
  /// @param _address Address to set
  /// @param _key bytes32 key location
  function setReference(address _address, bytes32 _key) external ifAuthorized(msg.sender, PRESIDENT) {
     require(_address != address(0), "setReference: Unexpectedly _address is 0x0");
     if (_key == bytes32(0)) emit LogicUpgrade(references[bytes32(0)], _address);
     else emit StorageUpgrade(references[_key], _address);
     if (references[_key] != address(0))
          delete references[_key];
     references[_key] = _address;
  }
}