contract c12539{
    // ################### INTERNAL FUNCTIONS ###################
    // rule enforcement and book-keeping for incoming deposits
    function tryDeposit() internal {
        require(cumAcceptedDeposits + msg.value <= maxCumAcceptedDeposits);
        if(whitelist[msg.sender] == true) {
            require(acceptedDeposits[msg.sender] + msg.value >= minDeposit);
            acceptedDeposits[msg.sender] += msg.value;
            cumAcceptedDeposits += msg.value;
        } else {
            require(alienDeposits[msg.sender] + msg.value >= minDeposit);
            alienDeposits[msg.sender] += msg.value;
            cumAlienDeposits += msg.value;
        }
        emit Deposit(msg.sender, msg.value);
    }
}