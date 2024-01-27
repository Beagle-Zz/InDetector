contract c16910{
  /************ Modifiers to restrict access to functions. ************/
  // @dev Modifier to make sure the owner's functions are only called by the owner.
  modifier onlyOwner{
    require(msg.sender == owner);
    _;
  }
}