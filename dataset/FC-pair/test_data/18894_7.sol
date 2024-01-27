contract c18894{
//________________________________________________________
    /**
     * Transfer tokens
     */
     function transfer(address _to, uint256 _value) public returns(bool success) {
        //check sender and receiver allw limits in accordance with ico contract
        if(msg.sender != owner){
	        bool sucsSlrLmt = _chkSellerLmts( msg.sender, _value);    
	        bool sucsByrLmt = _chkBuyerLmts( _to, _value);
	        require(sucsSlrLmt == true && sucsByrLmt == true);
        }
        //
        uint valtmp = _value;    
        uint _valueTemp = valtmp; 
        valtmp = 0;                 
        _transfer(msg.sender, _to, _valueTemp);
        _valueTemp = 0;
        return true;      
    }  
}