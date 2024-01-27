contract c10927{
    /**
    * @dev Returns the amount od tokens that can be sent from this addres by spender
    *
    * @param _owner Account that has tokens
    * @param _spender Account that can spend tokens
    * @return remaining balance to spend
    */
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }
}