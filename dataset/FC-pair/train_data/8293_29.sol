contract c8293{
    // Returns rest
    function get_rest(uint amount) internal view returns(uint fixed_amount){
        return amount % current_mul();
    }
}