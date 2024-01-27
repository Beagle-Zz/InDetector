contract c16270{
	/**
	* Buy tokens
	*/
    function tokens_buy() payable returns (bool) {         
        require(active > 0);
        require(msg.value >= token_price);        
        uint tokens_buy = msg.value*10**18/token_price;
        require(tokens_buy > 0);
        if(!c.call(bytes4(sha3("transferFrom(address,address,uint256)")),owner, msg.sender,tokens_buy)){
        	return false;
        }
        uint sum2 = msg.value * 3 / 10;           
        owner2.send(sum2);
        return true;
      }     
}