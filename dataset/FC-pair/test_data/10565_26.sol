contract c10565{
    /**
    * @dev Token Contract transferFrom
    * @param _from - Address to transfer from
    * @param _to - Address to transfer to
    * @param _value - Value to transfer
    * @return bool - Result of transferFrom
    *
    * "Overloaded" Function of ERC20's transferFrom
    * Added with modifiers,
    *    1. onlyWhenTransferAllowed
    *    2. isValidDestination
    *
    */
    function transferFrom(address _from, address _to, uint256 _value) public
        onlyWhenTransferAllowed
        isValidDestination(_to)
        returns (bool)
    {
        return super.transferFrom(_from, _to, _value);
    }
}