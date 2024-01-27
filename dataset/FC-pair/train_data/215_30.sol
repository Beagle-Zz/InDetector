contract c215{
    /**
        @dev Sets a new muliplier for freeing a horse
        @param newCarrotsMultiplier the new multiplier for feeding
    */
    function setCarrotsMultiplier(uint8 newCarrotsMultiplier) external 
    onlyOwner()  {
        carrotsMultiplier = newCarrotsMultiplier;
    }
}