contract c2736{
    /// @dev Since Sale is TokenControllerI, it has to implement transferAllowed() function
    /// @notice only the Sale and DisbursementHandler can disburse the initial tokens to their future owners
    function transferAllowed(address _from, address)
        external
        view
        returns (bool)
    {
        return _from == address(this) || _from == address(disbursementHandler);
    }
}