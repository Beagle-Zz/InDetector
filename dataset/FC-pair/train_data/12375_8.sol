contract c12375{
    // remove liquidity from contract
    function removeLiquidity(uint256 amount) external onlyControllingWallets{
        require(amount <= this.balance);
        mainWallet.transfer(amount);
        RemoveLiquidity(amount);
    }
}