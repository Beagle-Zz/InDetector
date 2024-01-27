contract c13403{
    /// @notice It will deposit tokens into the locker for given beneficiary.
    /// @param beneficiary Address of the beneficiary, whose tokens are being locked.
    /// @param amount Amount of tokens being locked
    function deposit (address beneficiary, uint amount ) public onlyAuction preLock {
        uint totalBalance = token.balanceOf(this);
        require(totalBalance.sub(deposited) >= amount);
        deposited = deposited.add(amount);
        emit Deposited(beneficiary, amount);
    }
}