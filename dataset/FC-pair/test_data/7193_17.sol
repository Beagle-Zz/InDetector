contract c7193{
    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public onlyActive returns (bool) {
        return super.transfer(_to, _value);
    }
}