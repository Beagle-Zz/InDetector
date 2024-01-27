contract c18100{
  /**** Delete Methods ***********/
  function deleteAddress(bytes32 key) public {
      delete _addressStorage[msg.sender][key];
  }
}