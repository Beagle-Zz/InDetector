contract c7461{
/////////
// Helper functions
/////////
    /// @notice States the total number of authorized payments in this contract
    /// @return The number of payments ever authorized even if they were canceled
    function numberOfAuthorizedPayments() public view returns (uint) {
        return authorizedPayments.length;
    }
}