contract c16666{
    // Allows execution by the oracle only
    modifier onlyOracle { 
        require(msg.sender == oracle);
        _; 
    }
}