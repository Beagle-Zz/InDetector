contract c18987{
    /// @notice calcs a perc without float or double :(
    function fraction(int256 _subject, int256 _numerator, int256 _denominator)
    private pure returns (int256) {
        int256 division = _subject * _numerator - _subject * _denominator;
        int256 total = _subject * _denominator + division;
        return total / _denominator;
    }
}