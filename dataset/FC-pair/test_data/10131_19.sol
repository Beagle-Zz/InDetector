contract c10131{
	/**
	 * @notice To allow ICO contracts to check whether RefundVault is ready to refund investors
	 */
	function isRefunding() public constant returns (bool) {
		return (state == State.Refunding);
	}
}