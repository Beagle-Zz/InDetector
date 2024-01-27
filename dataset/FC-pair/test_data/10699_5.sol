contract c10699{
    /**
     * Withdraw the funds
     */
    function safeWithdrawal(address safeAddress) public onlyOwner {
        require(safeAddress != address(0x0));
        require(safeAddress != address(this));
        uint256 balance = teamCup.balanceOf(address(this));
        teamCup.transfer(safeAddress, balance);
    }
}