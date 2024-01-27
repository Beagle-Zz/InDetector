contract c8669{
    /**
     * @dev Standard function transfer similar to ERC20 transfer with no _data
     *      Added due to backwards compatibility reasons
     */
    function transfer(address _to, uint _value) public returns (bool success) {
        require(_value > 0
                && cannotSend[msg.sender] == false
                && cannotReceive[_to] == false
                && now > cannotSendUntil[msg.sender]
                && now > cannotReceiveUntil[_to]);
        bytes memory empty;
        if (isContract(_to)) {
            return transferToContract(_to, _value, empty);
        } else {
            return transferToAddress(_to, _value, empty);
        }
    }
}