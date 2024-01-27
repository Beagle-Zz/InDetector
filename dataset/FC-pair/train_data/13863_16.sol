contract c13863{
    //Only first and second token reserve wallets
    modifier onlyTokenReserve {
        require(msg.sender == firstReserveWallet || msg.sender == secondReserveWallet);
        require(allocations[msg.sender] > 0);
        _;
    }
}