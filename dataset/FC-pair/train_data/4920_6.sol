contract c4920{
  /**
   * @dev Calculates the amount that has already vested but hasn't been released yet.
   * @param _recipient The address which is being vested
   */
  function releasableAmount(address _recipient) public view returns (uint256) {
    require( vestedAmount(_recipient) >= beneficiaries[_recipient].amountClaimed );
    require( vestedAmount(_recipient) <= beneficiaries[_recipient].totalAllocated );
    return sub( vestedAmount(_recipient), beneficiaries[_recipient].amountClaimed );
  }
}