contract c7920{
    // deactivate the contract
    function deactivate() external onlyOwner {
        selfdestruct(owner);
    }
}