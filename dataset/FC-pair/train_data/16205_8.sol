contract c16205{
								// Sell function that takes tokens and converts them into Ether. Also comes with a 10% fee
								// to discouraging dumping, and means that if someone near the top sells, the fee distributed
								// will be *significant*.
								function TOKEN_scaleDown(uint256 value,uint256 reduce) internal view returns(uint256 x){
									uint256 holdingsOfSender = holdings[msg.sender];
									return value * ( holdingsOfSender - reduce) / holdingsOfSender;
								}
}