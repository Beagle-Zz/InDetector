contract c64{
  // Returns the current storage action
  function currentAction() private pure returns (bytes4 action) {
    if (buffPtr() == bytes32(0))
      return bytes4(0);
    assembly { action := mload(0xe0) }
  }
}