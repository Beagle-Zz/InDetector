contract c11329{
    // Only allow wallets to call this function, not contracts.
    modifier isNotContractCaller {
        require(msg.sender == tx.origin);
        _;
    }
}