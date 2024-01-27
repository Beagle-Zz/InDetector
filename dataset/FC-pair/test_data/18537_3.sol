contract c18537{
    // a divided by b
    function div(uint a, uint b) internal pure returns (uint c) {
        assert(b != 0);
        c = a / b;
    }
}