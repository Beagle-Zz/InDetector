contract c12273{
    /**
     * @dev Requests oracles rates updating; funds oracles if needed.
     */
    function requestRates() public payable {
        require(getState() == State.REQUEST_RATES);
        // Or just sub msg.value
        // If it will be below zero - it will throw revert()
        // require(msg.value >= requestPrice());
        uint256 value = msg.value;
        for (uint256 i = 0; i < oracles.length; i++) {
            OracleI oracle = OracleI(oracles[i]);
            uint callPrice = oracle.getPrice();
            // If oracle needs funds - refill it
            if (oracles[i].balance < callPrice) {
                value = value.sub(callPrice);
                oracles[i].transfer(callPrice);
            }
            if (oracle.updateRate())
                OracleRequest(oracles[i]);
        }
        requestTime = now;
        if (value > 0)
            msg.sender.transfer(value);
    }
}