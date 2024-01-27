contract c3970{
    /// @dev sends ETH to XinXian team
    function transferETH() isOwner external {
        if (this.balance == 0) throw;
        if (!ethFundDeposit.send(this.balance)) throw;
    }
}