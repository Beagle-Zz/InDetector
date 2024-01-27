contract c13707{
	//verifies the amount greater than zero
	modifier greaterThanZero(uint256 _value){
		require(_value>0);
		_;
	}
}