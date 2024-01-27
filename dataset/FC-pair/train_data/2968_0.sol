contract c2968{
    //Guard overflow by making 0 an impassable barrier
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        return (c >= a && c >= b) ? c : 0;
    }
}