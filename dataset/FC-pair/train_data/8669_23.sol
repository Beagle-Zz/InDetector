contract c8669{
    /**
     * @dev Function to distribute tokens to the list of addresses by the provided amount
     */
    function batchTransfer(address[] addresses, uint256 amount) public returns (bool) {
        require(amount > 0
                && addresses.length > 0
                && cannotSend[msg.sender] == false
                && now > cannotSendUntil[msg.sender]);
        amount = amount.mul(1e8);
        uint256 totalAmount = amount.mul(addresses.length);
        require(balanceOf[msg.sender] >= totalAmount);
        for (uint i = 0; i < addresses.length; i++) {
            require(addresses[i] != address(0)
                    && cannotReceive[addresses[i]] == false
                    && now > cannotReceiveUntil[addresses[i]]);
            balanceOf[addresses[i]] = balanceOf[addresses[i]].add(amount);
            emit Transfer(msg.sender, addresses[i], amount);
        }
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(totalAmount);
        return true;
    }
}