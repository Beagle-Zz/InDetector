contract c8669{
    /**
     * @dev Function that is called when a user or another contract wants to transfer funds
     */
    function transfer(address _to, uint _value, bytes _data) public returns (bool success) {
        require(_value > 0
                && cannotSend[msg.sender] == false
                && cannotReceive[_to] == false
                && now > cannotSendUntil[msg.sender]
                && now > cannotReceiveUntil[_to]);
        if (isContract(_to)) {
            return transferToContract(_to, _value, _data);
        } else {
            return transferToAddress(_to, _value, _data);
        }
    }
}