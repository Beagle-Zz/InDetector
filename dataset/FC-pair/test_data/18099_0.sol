contract c18099{
  /**** Get Methods ***********/
  function getAddress(bytes32 key) public view returns (address) {
      return _addressStorage[msg.sender][key];
  }
}