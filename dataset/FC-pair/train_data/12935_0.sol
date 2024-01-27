contract c12935{
  // Returns code audit level, 0 if not present
  function isVerifiedAddress(address _auditorAddr, address _contractAddr) public view returns(uint) {
    bytes32 codeHash = getCodeHash(_contractAddr);
    return auditedContracts[_auditorAddr][codeHash].level;
  }
}