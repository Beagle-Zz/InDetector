contract c13496{
  //Check if given address is frozen
  function isFrozen(address _address) public view returns (bool frozen) {
      return frozenAccount[_address];
  }
}