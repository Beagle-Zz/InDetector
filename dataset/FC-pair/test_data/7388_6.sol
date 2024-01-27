contract c7388{
	/**
	 * @dev Allows the owner to withdraw the balance of the tokens.
	 * @param _commission The percentage of the commission 0-100
	 */
	function changeCommission(uint256 _commission) public onlyOwner {
		emit CommissionChanged(commission, _commission);
		commission = _commission;
	}
}