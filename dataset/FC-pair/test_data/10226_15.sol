contract c10226{
  /**
   * @dev Allows the current owner to explicity assign a new depository.
   * @param newDepository The address of the new depository.
   */
  function setDepository(address newDepository) public onlyOwner {
    require(newDepository != address(0));
    rocketStorage.setAddress(keccak256("token.depository"), newDepository);
    emit DepositoryTransferred(depository(), newDepository);
  }
}