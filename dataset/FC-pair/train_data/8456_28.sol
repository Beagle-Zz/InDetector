contract c8456{
    //========
    // Helpers
    //========
    // calculation of min value
    function min(uint a, uint b) internal pure returns (uint) {
        return a < b ? a : b;
    }
}