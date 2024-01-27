contract c16921{
    /// @dev Override unpause so it requires upgradedContractAddress not set, because then the contract was upgraded.
    function unpause() public onlyOwner whenPaused
    {
        require(upgradedContractAddress == address(0));
        paused = false;
    }
}