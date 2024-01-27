contract c7388{
	/**
	 * @dev Allows the owner to change the beneficiary.
	 * @param _beneficiary The broker address
	 */
	function changeBeneficiary(address _beneficiary) public onlyOwner {
		emit BeneficiaryChanged(beneficiary, _beneficiary);
		beneficiary = _beneficiary;
	}
}