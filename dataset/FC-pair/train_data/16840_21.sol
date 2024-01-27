contract c16840{
    /*
     * Transfer token from message sender to another
     *
     * @param to: Destination address
     * @param value: Amount of AMO token to transfer
     */
    function transfer(address to, uint256 value)
        public
        onlyWhenTransferAllowed
        onlyValidDestination(to)
        onlyAllowedAmount(msg.sender, value)
        returns (bool)
    {
        return super.transfer(to, value);
    }
}