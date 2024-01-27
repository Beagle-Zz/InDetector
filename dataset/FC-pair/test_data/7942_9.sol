contract c7942{
    /// @dev sends ETH to BUGX team
    function transferETH() isOwner external {
        require (address(this).balance != 0);
        require (ethFundDeposit.send(address(this).balance));
    }
}