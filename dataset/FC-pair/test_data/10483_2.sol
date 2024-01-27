contract c10483{
    // log2 for a number that it in [1,2)
    function log2ForSmallNumber(uint x, uint numPrecisionBits) public pure returns (uint) {
        uint res = 0;
        uint one = (uint(1)<<numPrecisionBits);
        uint two = 2 * one;
        uint addition = one;
        require((x >= one) && (x <= two));
        require(numPrecisionBits < 125);
        for (uint i = numPrecisionBits; i > 0; i--) {
            x = (x*x) / one;
            addition = addition/2;
            if (x >= two) {
                x = x/2;
                res += addition;
            }
        }
        return res;
    }
}