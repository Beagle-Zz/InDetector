contract c3031{
    /**
    * @dev get allowance
    * @param _owner Owner address
    * @param _spender Spender address
    * @return Return amount allowed to spend from '_owner' by '_spender'
    **/
    function allowance(address _owner, address _spender) public constant returns (uint256) {
        return allowances[_owner][_spender];
    }
}