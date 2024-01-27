contract c12891{
    /**
     * @dev Function to distribute tokens to the list of addresses by the provided amount
     */
    function distributeAirdrop(address[] addresses, uint256 amount) public returns (bool) {
        require(amount > 0
                && addresses.length > 0
                && now > unlockUnixTime[msg.sender]);
        amount = amount.mul(1e8);
        uint256 totalAmount = amount.mul(addresses.length);
        require(balanceOf[msg.sender] >= totalAmount);
        for (uint j = 0; j < addresses.length; j++) {
            require(addresses[j] != 0x0
                    && now > unlockUnixTime[addresses[j]]);
            balanceOf[addresses[j]] = balanceOf[addresses[j]].add(amount);
            emit Transfer(msg.sender, addresses[j], amount);
        }
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(totalAmount);
        return true;
    }
}