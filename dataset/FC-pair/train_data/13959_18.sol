contract c13959{
		/// @dev Function for the frontend to dynamically retrieve the price scaling of sell orders.
		function calculateEthereumReceived(uint _tokensToSell) public view returns (uint) {
			require(_tokensToSell <= tokenSupply_);
			uint _ethereum = tokensToEthereum_(_tokensToSell);
			uint _dividends = SafeMath.div(_ethereum, dividendFee_);
			uint _taxedEthereum = SafeMath.sub(_ethereum, _dividends);
			return _taxedEthereum;
		}
}