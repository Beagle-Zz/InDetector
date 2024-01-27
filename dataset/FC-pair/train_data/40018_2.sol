contract c40018{
     
     
     
     
    function set_minimum_payment(uint256 new_limit) {
        if ( msg.sender == thebank ){
            minimum_deposit_amount = new_limit;
        }
    }
}