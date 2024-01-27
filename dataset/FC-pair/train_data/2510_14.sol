contract c2510{
/// @dev Users use this function to withdraw ether from their custody
/// @param _tokenAddress of the ERC20 to withdraw from
/// @param _amount to withdraw
/// @param _custodyAddress to withdraw from
function withdrawTokensFromCustody(address _tokenAddress, uint _amount, address _custodyAddress, address _recipient)
external whenNotPaused onlyAllowedInPhase(SettlementPhase.FINISHED) onlyExchangeOrOwner {
Custody custody = Custody(_custodyAddress);
custody.transferToken(_tokenAddress, _recipient,_amount);
}
}