contract c2510{
/// @dev Exchange uses this function to withdraw ether from the contract
/// @param _amount to withdraw
/// @param _recipient to send withdrawn ether to
function withdrawFromManager(uint _amount, address _recipient) external onlyExchangeOrOwner
whenNotPaused onlyAllowedInPhase(SettlementPhase.FINISHED) {
_recipient.transfer(_amount);
}
}