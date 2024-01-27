contract c4887{
    /// @dev Call destroy(address[] tokens) instead
    function destroy() public onlyContractOwner {
        revert();
    }
}