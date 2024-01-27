contract c18262{
    /**
     * @dev ITokenEventListener implementation. Notify active poll contracts about token transfers
     */
    function onTokenTransfer(address _from, address /*_to*/, uint256 _value) external {
        require(msg.sender == address(token));
        if(address(tapPoll) != address(0) && !tapPoll.finalized()) {
            tapPoll.onTokenTransfer(_from, _value);
        }
         if(address(refundPoll) != address(0) && !refundPoll.finalized()) {
            refundPoll.onTokenTransfer(_from, _value);
        }
    }
}