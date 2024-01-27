contract c4901{
    /// @dev Call destroy(address[] tokens) instead
    function destroy() public onlyContractOwner {
        revert();
    }
}