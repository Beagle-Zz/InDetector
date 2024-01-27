contract c16771{
    /**
    * Returns the amount of tokens one has allowed another to spend on his or her behalf.
    *
    * @param _owner The address which is the owner of the tokens
    * @param _spender The address which has been allowed to spend tokens on the owner's
    * behalf
    **/
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowances[_owner][_spender];
    }
}