contract c7516{
    /**
     * Gets the number of tokens that an `_owner` has approved for a _spender
     *     to `transferFrom`.
     * @param _owner Wallet address that tokens can be withdrawn from.
     * @param _spender Wallet address that tokens can be deposited to.
     * @return The number of tokens allowed to be transferred.
     */
    function allowance(address _owner, address _spender)
        public
        constant
        returns (uint remaining)
    {
        return allowed[_owner][_spender];
    }
}