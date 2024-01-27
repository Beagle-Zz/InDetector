contract c18043{
    // Next Tier will increment manually and Paused by the team to guarantee safe transition
    // Initialized next tier if previous tier sold out
    // For contributor safety we pause the seedSale process
    function nextTier() onlyOwner public {
        require(paused == true);
        require(activeTier < 7);
        uint256 _tierIndex = activeTier;
        activeTier = _tierIndex +1;
        emit OpenTier(activeTier);
    }
}