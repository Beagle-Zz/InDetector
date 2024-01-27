contract c8926{
    /**
     * The last mint that will ever happen. Disables the multiMint function and mints remaining 40% of tokens (in
     * regard of 60% tokens minted before) to a `tokenDistributor` address.
     */
    function lastMint () external tokenDistributionPeriodOnly {
        require(totalSupply > 0);
        uint256 remaining = totalSupply.mul(40).div(60); // Portion of tokens for DreamTeam (40%)
        // To make the total supply rounded (no fractional part), subtract the fractional part from DreamTeam's balance
        uint256 fractionalPart = remaining.add(totalSupply) % (uint256(10) ** decimals);
        remaining = remaining.sub(fractionalPart); // Remove the fractional part to round the totalSupply
        balanceOf[tokenDistributor] = balanceOf[tokenDistributor].add(remaining);
        emit Transfer(0x0, tokenDistributor, remaining);
        totalSupply = totalSupply.add(remaining);
        tokenDistributor = 0x0; // Disable multiMint and lastMint functions forever
    }
}