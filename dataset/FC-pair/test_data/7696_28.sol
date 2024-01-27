contract c7696{
    // Removes burned values 123 -> 120  
    // Returns fixed
    function fix_amount(uint amount) public view returns(uint fixed_amount){
        return ( amount / current_mul() ) * current_mul();
    }
}