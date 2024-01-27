contract c2827{
		/**
		* @dev Integer division of two numbers, truncating the quotient.
		*/
		function div(uint a, uint b) internal pure returns (uint) {
			// assert(b > 0); // Solidity automatically throws when dividing by 0
			uint c = a / b;
			// assert(a == b * c + a % b); // There is no case in which this doesn't hold
			return c;
		}
}