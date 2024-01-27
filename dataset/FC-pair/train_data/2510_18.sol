contract c2510{
/// @dev This function is used to finish the settlement process
function finishSettlement() external whenNotPaused onlyExchangeOrOwner
onlyAllowedInPhase(SettlementPhase.ONGOING) {
//TODO phase change event?
earliestNextSettlementTimestamp = lastSettlementStartedTimestamp + 23 hours;
currentSettlementPhase = SettlementPhase.FINISHED;
}
}