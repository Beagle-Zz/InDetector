contract c10565{
    /**
    * @dev Token Contract transfer
    * @param _to - Address to transfer to
    * @param _value - Value to transfer
    * @return bool - Result of transfer
    * "Overloaded" Function of ERC20Basic's transfer
    *
    */
    function transfer(address _to, uint256 _value) public
        onlyWhenTransferAllowed
        isValidDestination(_to)
        returns (bool)
    {
        return super.transfer(_to, _value);
    }
}