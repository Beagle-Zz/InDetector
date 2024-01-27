contract c13534{
	// Parameters like status can only be changed by the contract owner
	modifier onlyOwner() {
		require( 
			msg.sender == owner,
			'Only the administrator can change this'
		);
		_;
	}
}