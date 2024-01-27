contract c10483{
    /* solhint-enable code-complexity */
    function countLeadingZeros(uint p, uint q) public pure returns (uint) {
        uint denomator = (uint(1)<<255);
        for (int i = 255; i >= 0; i--) {
            if ((q*denomator)/denomator != q) {
                // overflow
                denomator = denomator/2;
                continue;
            }
            if (p/(q*denomator) > 0) return uint(i);
            denomator = denomator/2;
        }
        return uint(-1);
    }
}