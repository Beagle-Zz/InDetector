contract c18888{
  /**
   * @notice Allow the beneficiary to change its address
   * @param target the address to transfer the right to
   */
  function changeBeneficiary(address target) onlyBeneficiary public {
    require(target != 0);
    beneficiary = target;
  }
}