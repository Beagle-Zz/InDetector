contract c13332{
    /**
     * The last mint that will ever happen. Disables the multiMint function and mints remaining 40% of tokens (in
     * regard of 60% tokens minted before) to a `tokenDistributor` address.
     */
    function lastMint () external {
        require(tokenDistributor != 0x0 && tokenDistributor == msg.sender && totalSupply > 0);
        uint256 remaining = totalSupply * 40 / 60; // Portion of tokens for DreamTeam (40%)
        // To make the total supply rounded (no fractional part), subtract the fractional part from DreamTeam's balance
        uint256 fractionalPart = (remaining + totalSupply) % (uint256(10) ** decimals);
        if (fractionalPart <= remaining)
            remaining -= fractionalPart; // Remove the fractional part to round the totalSupply
        balanceOf[tokenDistributor] += remaining;
        emit Transfer(0x0, tokenDistributor, remaining);
        totalSupply += remaining;
        tokenDistributor = 0x0; // Disable multiMint and lastMint functions forever
    }
}