contract c2224{
    // Only who is allowed to distribute the GOT to the participant ETH addresses (specified
    // during the contract deployment)
    modifier isDistributor() {
        require(msg.sender == distributor_address);
        _;
    }
}