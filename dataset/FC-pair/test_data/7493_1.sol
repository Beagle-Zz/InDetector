contract c7493{
    /// @dev Returns natural logarithm value of given x
    /// @param x x
    /// @return ln(x)
    function ln(uint x)
        public
        pure
        returns (int)
    {
        require(x > 0);
        // binary search for floor(log2(x))
        int ilog2 = floorLog2(x);
        int z;
        if (ilog2 < 0)
            z = int(x << uint(-ilog2));
        else
            z = int(x >> uint(ilog2));
        // z = x * 2^-⌊log₂x⌋
        // so 1 <= z < 2
        // and ln z = ln x - ⌊log₂x⌋/log₂e
        // so just compute ln z using artanh series
        // and calculate ln x from that
        int term = (z - int(ONE)) * int(ONE) / (z + int(ONE));
        int halflnz = term;
        int termpow = term * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 3;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 5;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 7;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 9;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 11;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 13;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 15;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 17;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 19;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 21;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 23;
        termpow = termpow * term / int(ONE) * term / int(ONE);
        halflnz += termpow / 25;
        return (ilog2 * int(ONE)) * int(ONE) / int(LOG2_E) + 2 * halflnz;
    }
}