contract c2280{
    /**
    *@param _owner address
    *@param _spender address
    *@return Returns the remaining allowance of tokens granted to the _spender from the _owner
    */
    function allowance(address _owner, address _spender) public view returns (uint) {
       return allowed[_owner][_spender]; }
}