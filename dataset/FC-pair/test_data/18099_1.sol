contract c18099{
  /**** Set Methods ***********/
  function setAddress(bytes32 key, address value) public {
      _addressStorage[msg.sender][key] = value;
  }
}