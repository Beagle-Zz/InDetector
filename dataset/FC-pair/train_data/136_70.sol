contract c136{
    /// @dev requires a proposal to be active
    modifier proposalPending() {
        require(proposalInProgress,"no proposal pending");
        _;
    }
}