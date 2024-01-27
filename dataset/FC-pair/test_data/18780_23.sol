contract c18780{
    /// @notice Withdraw any accumulated question fees from the specified address into this contract
    /// @dev Funds can then be liberated from this contract with our withdraw() function
    function callWithdraw() 
        onlyOwner 
    public {
        realitycheck.withdraw(); 
    }
}