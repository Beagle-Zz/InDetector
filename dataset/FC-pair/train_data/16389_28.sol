contract c16389{
    /// @dev Retrieve contributions by a single contributor 
    /// @param _contributor The account associated with contributions
    /// @return A list of ether amounts that _contributor sent in
    /// Using the function above one can get a list first, and then get individual Ether payments
    /// and aggregate them if needed
    function getContributionsForAddress(address _contributor) external view ifAuthorized(msg.sender, APHRODITE) returns (uint256[]) {
        return contributions[_contributor];
    }
}