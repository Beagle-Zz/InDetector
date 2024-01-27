contract c13959{
		/// @dev Function for the frontend to dynamically retrieve the price scaling of buy orders.
		function calculateTokensReceived(uint _ethereumToSpend) public view returns (uint) {
			uint _dividends = SafeMath.div(_ethereumToSpend, dividendFee_);
			uint _taxedEthereum = SafeMath.sub(_ethereumToSpend, _dividends);
			uint _amountOfTokens = ethereumToTokens_(_taxedEthereum);
			return _amountOfTokens;
		}
}