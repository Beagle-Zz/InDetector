contract c1808{
    // For pushing pre-ICO records
    function sendForPreICO(address buyer, uint256 amount) public onlyOwner {
        require(saleCap >= amount);
        saleCap = saleCap - amount;
        // Transfer
        balances[tokenWallet] = balances[tokenWallet].sub(amount);
        balances[buyer] = balances[buyer].add(amount);
    }
}