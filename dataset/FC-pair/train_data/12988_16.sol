contract c12988{
  // Stops owner from gaining access to all functionality
  modifier onlyContract() {
    require(msg.sender != address(0));
    require(contracts[msg.sender]); 
    _;
  }
}