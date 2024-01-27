contract c12263{
    // This is basically so you don't have to add 1 to the last completed tier.
    //  You're welcome.
    function currentTier() public view returns (uint256) {
        if (tier == 5)
        {
            return 5;
        }
        else
        {
            return tier + 1;
        }
    }
}