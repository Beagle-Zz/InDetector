contract c18611{
    /**
     * @dev   Upgrade function transferring all this contract's ether
     *        via the standard receive ether function in the proposed
     *        new disbursal contract.
     *
     * @param _addr    The new disbursal contract address.
     */
    function upgrade(address _addr) onlyEtheraffle external {
        upgraded = true;
        emit LogUpgrade(_addr, this.balance, now);
        ReceiverInterface(_addr).receiveEther.value(this.balance)();
    }
}