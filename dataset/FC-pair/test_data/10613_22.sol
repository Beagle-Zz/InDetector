contract c10613{
    /**
     * Calculate size of an order struct when tightly packed
     *
     * @param order Order to calculate size of
     * @return Size in bytes
     */
    function sizeOf(Order memory order)
        internal
        pure
        returns (uint)
    {
        return ((0x14 * 7) + (0x20 * 9) + 4 + order.calldata.length + order.replacementPattern.length + order.staticExtradata.length);
    }
}