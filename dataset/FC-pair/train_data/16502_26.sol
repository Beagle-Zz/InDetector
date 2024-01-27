contract c16502{
	// ----------------------------------------------------------------------------------------------------------------
	// we override the token transfer functions to block transfers before startTransfersDate timestamp
	modifier canDoTransfers() {
		require(hasCrowdsaleFinished());
		_;
	}
}