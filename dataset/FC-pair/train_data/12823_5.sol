contract c12823{
	// calculates amount of tokens available to redeem from investor, validations are not required
	function __redeemAmount(address investor) internal view returns (uint amount) {
		// round down allowance taking into account token decimals
		uint allowance = token.allowance(investor, this) / k;
		// for open crowdsales we check previously tracked investor balance
		uint balance = balances[investor];
		// return allowance safely by checking also the balance
		return balance < allowance ? balance : allowance;
	}
}