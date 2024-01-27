contract c16883{
  /**
   * @dev Sets the address of the owner.
   * @param _address The address of the new owner of the Token Contract.
   */
  function transferOwnership(address _address) external onlyBy(owner) {
    require(_address != address(0)); // Prevent rendering it unusable
    owner = _address;
  }
}