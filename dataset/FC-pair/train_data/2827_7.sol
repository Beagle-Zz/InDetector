contract c2827{
		/*==========================================
		=            INTERNAL FUNCTIONS            =
		==========================================*/
		/**
		 * Calculate Token price based on an amount of incoming ethereum
		 * It's an algorithm, hopefully we gave you the whitepaper with it in scientific notation;
		 * Some conversions occurred to prevent decimal errors or underflows / overflows in solidity code.
		 */
		function ethereumToTokens_(uint _ethereum) internal view returns (uint) {
			uint _tokenPriceInitial = tokenPriceInitial_ * 1e18;
			uint _tokensReceived =
			 (
				(
					// underflow attempts BTFO
					SafeMath.sub(
						(sqrt
							(
								(_tokenPriceInitial**2)
								+
								(2*(tokenPriceIncremental_ * 1e18)*(_ethereum * 1e18))
								+
								(((tokenPriceIncremental_)**2)*(tokenSupply_**2))
								+
								(2*(tokenPriceIncremental_)*_tokenPriceInitial*tokenSupply_)
							)
						), _tokenPriceInitial
					)
				)/(tokenPriceIncremental_)
			)-(tokenSupply_)
			;
			return _tokensReceived;
		}
}