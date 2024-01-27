contract c3575{
    /**
     * @dev Checks the amount of tokens that an owner allowed to a spender.
     *
     * @param _owner The address which owns the funds allowed for spending by a third-party.
     * @param _spender The third-party address that is allowed to spend the tokens.
     *
     * @return The number of tokens available to `_spender` to be spent.
     */
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}