contract c4902{
    /// @dev Allow access only for oracle
    modifier onlyOracle {
        if (oracles[msg.sender]) {
            _;
        }
    }
}