contract c40019{
     
     
     
     
	 
    function extend_life_of_contract (uint256 newblock){
        if ( msg.sender != thebank || newblock < contract_alive_until_this_block ) throw;
         
        contract_alive_until_this_block = newblock; 
         
        term_deposit_end_block[thebank] = contract_alive_until_this_block;
    }
}