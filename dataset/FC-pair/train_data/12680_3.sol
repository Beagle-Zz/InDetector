contract c12680{
    //don't allow smart contracts to play
    modifier noContracts {
        require(msg.sender == tx.origin);
        _;
    }
}