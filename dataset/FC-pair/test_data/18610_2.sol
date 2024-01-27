contract c18610{
    /**
     * @dev   Standard receive ether function, forward-compatible
     *        with proposed future disbursal contract.
     */
    function receiveEther() payable external {
        emit LogEtherReceived(msg.sender, msg.value, now);
    }
}