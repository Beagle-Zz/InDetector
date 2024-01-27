contract c18035{
  // Setter for the enforce flag - only updatable by the owner
  function setEnforceAddressMatch(bool _enforceAddressMatch) onlyOwner public {
    enforceAddressMatch = _enforceAddressMatch;
  }
}