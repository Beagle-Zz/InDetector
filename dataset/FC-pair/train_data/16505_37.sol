contract c16505{
    // Withdrawal eth to owner
    function withdrawal() public onlyOwner {
        updateReservedWei();
        uint256 withdrawalWei = reservedWei;
        reservedWei = 0;
        forwardFunds(withdrawalWei);
    }
}