contract c7390{
	/**
	 * @dev Allows the owner to change the brokerImp.
	 * @param _brokerImp The brokerImp address
	 */
	function changeBrokerImp(address _brokerImp) public onlyOwner {
		emit BrokerImpChanged(brokerImp, _brokerImp);
		brokerImp = BrokerImp(_brokerImp);
	}
}