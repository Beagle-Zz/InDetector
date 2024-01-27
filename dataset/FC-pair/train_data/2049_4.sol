contract c2049{
    /**
     * get the balance of account
     * @param _owner The account address
     */
    function balanceOf(address _owner) view public returns (uint256) {
        return balances[_owner];
    }
}