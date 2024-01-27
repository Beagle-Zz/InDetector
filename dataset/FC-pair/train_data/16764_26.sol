contract c16764{
    /*
     * Transfer token from 'from' address to 'to' addreess
     *
     * @param from: Origin address
     * @param to: Destination address
     * @param value: Amount of AMO Coin to transfer
     */
    function transferFrom(address from, address to, uint256 value)
        public
        onlyWhenTransferAllowed
        onlyValidDestination(to)
        onlyAllowedAmount(from, value)
        returns (bool)
    {
        return super.transferFrom(from, to, value);
    }
}