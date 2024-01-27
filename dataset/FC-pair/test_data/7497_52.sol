contract c7497{
    // > Math fns
    function min(uint a, uint b) 
        public
        pure
        returns (uint)
    {
        if (a < b) {
            return a;
        } else {
            return b;
        }
    }
}