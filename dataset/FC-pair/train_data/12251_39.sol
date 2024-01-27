contract c12251{
    /// @notice Checks that a given zodiac is able to breed (i.e. it is not pregnant or
    ///  in the middle of a siring cooldown).
    /// @param _ZodiacId reference the id of the zodiac, any user can inquire about it
    function isReadyToBreed(uint256 _ZodiacId)
        public
        view
        returns (bool)
    {
        require(_ZodiacId > 0);
        Zodiac storage zod = zodiacs[_ZodiacId];
        return _isReadyToBreed(zod);
    }
}