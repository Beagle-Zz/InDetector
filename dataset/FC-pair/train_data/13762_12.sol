contract c13762{
    /// @dev check seed form coo
    function checkCooSeed(uint32 _season) public view returns (uint64) {
        require(finished[_season] > 0);
        return seedFromCOO[_season];
    }
}