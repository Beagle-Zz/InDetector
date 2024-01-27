contract c10369{
    //Only final token reserve wallet
    modifier onlyTokenReserve {
        require(msg.sender == finalReserveWallet);
        require(allocations[msg.sender] > 0);
        _;
    }
}