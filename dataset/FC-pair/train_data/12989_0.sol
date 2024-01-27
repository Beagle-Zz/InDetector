contract c12989{
  // Returns code audit level, 0 if not present
  function isVerifiedAddress(address _auditorAddr, address _contractAddr) public view returns(uint) {
    bytes32 codeHash = keccak256(codeAt(_contractAddr));
    return auditedContracts[_auditorAddr][codeHash].level;
  }
}