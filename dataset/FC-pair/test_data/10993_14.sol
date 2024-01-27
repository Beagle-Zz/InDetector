contract c10993{
    /**
     * active balance of address
     */
    function activeBalanceOf(address _owner) public view returns (uint256) {
        if( uint256(now) < locks[_owner].releaseTimeS ) {
            return balances[_owner].sub(locks[_owner].balance);
        }
        return balances[_owner];
    }
}