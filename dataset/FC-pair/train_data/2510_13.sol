contract c2510{
/// @dev Users use this function to withdraw ether from their custody
/// @param _amount to withdraw
/// @param _custodyAddress to withdraw from
function withdrawFromCustody(uint _amount, address _custodyAddress,address _recipient) external onlyExchangeOrOwner
whenNotPaused onlyAllowedInPhase(SettlementPhase.FINISHED) {
Custody custody = Custody(_custodyAddress);
custody.withdraw(_amount, _recipient);
}
}