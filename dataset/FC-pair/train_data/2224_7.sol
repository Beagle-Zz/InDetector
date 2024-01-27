contract c2224{
    // Only who is allowed to whitelist the participant ETH addresses (specified
    // during the contract deployment)
    modifier isWhitelister() {
        require(msg.sender == whitelister_address);
        _;
    }
}