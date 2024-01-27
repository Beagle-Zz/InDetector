contract c7457{
    // Burn tokens. Anyone can burn from its own account. YOLO.
    // Used by to burn from Augmint reserve or by Lender contract after loan repayment
    function burn(uint amount) external {
        require(balances[msg.sender] >= amount, "balance must be >= amount");
        balances[msg.sender] = balances[msg.sender].sub(amount);
        totalSupply = totalSupply.sub(amount);
        emit Transfer(msg.sender, 0x0, amount);
        emit AugmintTransfer(msg.sender, 0x0, amount, "", 0);
    }
}