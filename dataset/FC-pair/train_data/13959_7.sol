contract c13959{
		/**
		 * @dev Calculate token sell value.
		 *  It's an algorithm, hopefully we gave you the whitepaper with it in scientific notation;
		 *  Some conversions occurred to prevent decimal errors or underflows / overflows in solidity code.
		 */
		function tokensToEthereum_(uint _tokens) internal view returns (uint) {
			uint tokens_ = (_tokens + 1e18);
			uint _tokenSupply = (tokenSupply_ + 1e18);
			uint _etherReceived =
			(
				// underflow attempts BTFO
				SafeMath.sub(
					(
						(
							(
								tokenPriceInitial_ +(tokenPriceIncremental_ * (_tokenSupply/1e18))
							)-tokenPriceIncremental_
						)*(tokens_ - 1e18)
					),(tokenPriceIncremental_*((tokens_**2-tokens_)/1e18))/2
				)
			/1e18);
			return _etherReceived;
		}
}