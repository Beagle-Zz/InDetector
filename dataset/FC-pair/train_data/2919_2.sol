contract c2919{
  // Add evidence to audited code, only author, if _newLevel is different from original
  // updates the contract's level
  function addEvidence(bytes32 _codeHash, uint _newLevel, bytes32 _ipfsHash) public {
    address auditor = msg.sender;
    require(auditedContracts[auditor][_codeHash].insertedBlock != 0);
    if (auditedContracts[auditor][_codeHash].level != _newLevel)
      auditedContracts[auditor][_codeHash].level = _newLevel;
    emit AttachedEvidence(auditor, _codeHash, _ipfsHash);
  }
}