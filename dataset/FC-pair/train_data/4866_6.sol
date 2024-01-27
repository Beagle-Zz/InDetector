contract c4866{
    /// @dev Call destroy(address[] tokens) instead
    function destroy() public onlyContractOwner {
        revert();
    }
}