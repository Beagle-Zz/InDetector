contract c12375{
    // grantVestedEDEXContract and mainWallet can transfer to allow team allocations
    modifier isSetTrading{
        require(setTrading || msg.sender == mainWallet || msg.sender == grantVestedEDEXContract);
        _;
    }
}