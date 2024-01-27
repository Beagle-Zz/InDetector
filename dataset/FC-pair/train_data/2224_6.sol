contract c2224{
    // Only owner of the contract
    modifier isOwner() {
        require(msg.sender == owner_address);
        _;
    }
}