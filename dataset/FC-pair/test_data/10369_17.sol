contract c10369{
    //Token allocations have not been set
    modifier notAllocated {
        require(allocations[teamReserveWallet] == 0);
        require(allocations[finalReserveWallet] == 0);
        _;
    }
}