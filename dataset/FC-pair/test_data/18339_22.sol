contract c18339{
  //
  // Set address of migration target contract
  // @param _target The address of the MigrationTarget contract
  //
  function setMigrationTarget(address _target) onlyOwner public {
    migrationTarget = _target;
  }
}