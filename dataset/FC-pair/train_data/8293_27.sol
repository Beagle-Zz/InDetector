contract c8293{
    // Returns current multipl. based on round
    // Returns current multiplier based on round
    function current_mul() internal view returns(uint _current_mul){
        return mul[round-1];
    }
}