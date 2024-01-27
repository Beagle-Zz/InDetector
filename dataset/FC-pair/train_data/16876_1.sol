contract c16876{
	/* The end time of the lock account is obtained */
	function lockAccountOf(address _owner) constant returns (uint256 enddata) {
        return lockAccount[_owner];
    }
}