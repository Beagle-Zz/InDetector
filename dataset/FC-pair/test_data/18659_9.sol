contract c18659{
  // Modifier for accessibility to deploy a hero on a location.
  modifier onlyAccessDeploy {
    require(msg.sender == owner || deployAccess[msg.sender] == true);
    _;
  }
}