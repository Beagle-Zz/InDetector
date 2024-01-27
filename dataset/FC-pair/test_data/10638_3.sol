contract c10638{
    /**
     * @dev Set randomizer address
     */
    function setRandomizer(address _rand) external onlyOwner {
        rand = Randomizer(_rand);
    }
}