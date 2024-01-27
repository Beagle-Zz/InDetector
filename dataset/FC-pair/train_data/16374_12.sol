contract c16374{
    // Check if sender is a solver
    modifier onlySolvers() {
        require(isSolver[msg.sender]);
        _;
    }
}