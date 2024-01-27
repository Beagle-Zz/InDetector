contract c7791{
    /// @notice Will transfer all ether in this account to the contract owner.
    function withdraw() public ownerOnly {
        owner.transfer(address(this).balance);
    }
}