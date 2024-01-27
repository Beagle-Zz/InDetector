contract c13066{
    // This is basically so you don't have to add 1 to the last completed tier.
    //  You're welcome.
    function currentTier() public view returns (uint256) {
        if (tier == 10)
        {
            return 10;
        }
        else
        {
            return tier + 1;
        }
    }
}