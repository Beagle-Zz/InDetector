contract c4920{
  /**
   * @notice Transfer a recipients available allocation to their address.
   * @param _recipient The address to withdraw tokens for
   */
  function transferTokens(address _recipient) public {
    require(beneficiaries[_recipient].amountClaimed < beneficiaries[_recipient].totalAllocated);
    require( now >= beneficiaries[_recipient].cliff );
    require(!beneficiaries[_recipient].disable);
    uint256 unreleased = releasableAmount(_recipient);
    require( unreleased > 0);
    IOV.transfer(_recipient, unreleased);
    beneficiaries[_recipient].amountClaimed = vestedAmount(_recipient);
    emit LogIOVClaimed(_recipient, unreleased);
  }
}