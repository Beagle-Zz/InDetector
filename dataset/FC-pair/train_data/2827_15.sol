contract c2827{
		/**
		 * Retrieve the dividend balance of any single address.
		 */
		function dividendsOf(address _customerAddress) public view returns (uint) {
			return (uint) ((int)(profitPerShare_ * tokenBalanceLedger_[_customerAddress]) - payoutsTo_[_customerAddress]) / magnitude;
		}
}