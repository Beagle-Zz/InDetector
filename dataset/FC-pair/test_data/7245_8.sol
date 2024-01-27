contract c7245{
    /**
     * @notice Check `_value` tokens allowed to `_spender` by `_owner`
     * @param _owner The address of the Owner
     * @param _spender The address of the Spender
     */
    function allowance(address _owner, address _spender) view public returns (uint256 remaining) {
        return approved[_owner][_spender];
    }
}