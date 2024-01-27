contract c12251{
    /// @dev Checks whether a Zodiac is currently pregnant.
    /// @param _ZodiacId reference the id of the zodiac, any user can inquire about it
    function isPregnant(uint256 _ZodiacId)
        public
        view
        returns (bool)
    {
        require(_ZodiacId > 0);
        // A Zodiac is pregnant if and only if this field is set
        return zodiacs[_ZodiacId].siringWithId != 0;
    }
}