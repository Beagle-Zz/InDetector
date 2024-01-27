contract c9496{
    /**
     * @dev Standard function transfer similar to ERC20 transfer with no _data
     *      Added due to backwards compatibility reasons
     */
    function transfer(address _to, uint _value) whenNotPaused public returns (bool success) {
        require(_value > 0
                && now > unlockUnixTime[msg.sender]
                && now > unlockUnixTime[_to]);
        bytes memory empty;
        if (isContract(_to)) {
            return transferToContract(_to, _value, empty);
        } else {
            return transferToAddress(_to, _value, empty);
        }
    }
}