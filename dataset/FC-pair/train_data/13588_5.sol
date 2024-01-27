contract c13588{
  /**
  * @dev Adding new owners
  */
  function newOwner(address _owner) onlyOwner external returns (bool) {
    require(_owner != 0);
    owners[_owner] = msg.sender;
    return true;
  }
}