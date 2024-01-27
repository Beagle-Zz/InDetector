contract c12709{
  //a modifier can be used on methods to inherit the require
  modifier onlyContractOwner {
    require(msg.sender == contractOwner);
    _;
  }
}