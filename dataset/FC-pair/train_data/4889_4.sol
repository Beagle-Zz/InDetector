contract c4889{
    /// @dev Allow access only for oracle
    modifier onlyOracle {
        if (oracles[msg.sig][msg.sender]) {
            _;
        }
    }
}