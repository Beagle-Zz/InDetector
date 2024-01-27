contract c3575{
    /**
     * @dev Deposits ETH into the refund safe.
     *
     * @param _address The address of the participant in the fundraiser.
     */
    function deposit(address _address) onlyOwner public payable {
        require(state == State.ACTIVE);
        deposits[_address] = deposits[_address].plus(msg.value);
    }
}