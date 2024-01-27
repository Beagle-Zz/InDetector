contract c2968{
    //Guard underflow by making 0 an impassable barrier
    function sub(uint a, uint b) internal pure returns (uint) {
        return (a >=b) ? (a - b): 0;
    }
}