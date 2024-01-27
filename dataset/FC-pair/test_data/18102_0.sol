contract c18102{
  /**** Get Methods ***********/
  function getAddress(bytes32 key) public view returns (address) {
      return _addressStorage[msg.sender][key];
  }
}