contract c10144{
    /**
     * @return True iff subtracting y from x will not overflow in the negative direction.
     */
    function subIsSafe(uint x, uint y)
        pure
        internal
        returns (bool)
    {
        return y <= x;
    }
}