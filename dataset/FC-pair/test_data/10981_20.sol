contract c10981{
    /// Compares two strings and returns true if and only if they are equal.
    function equalStrings(string _a, string _b) pure private returns (bool) {
        return compare(_a, _b) == 0;
    }
}