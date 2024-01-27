contract c12263{
    // Ether remaining for tier.
    function leftInTier() public view returns (uint256) {
        if (tier == 5) {
            return 0;
        }
        else
        {
            return levels[tier] - _submitted;
        }
    }
}