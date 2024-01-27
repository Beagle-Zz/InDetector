contract c2440{
    /// @notice Admin failsafe for destroying the contract
    function kill() onlyOwner public {
        selfdestruct(owner);
    }
}