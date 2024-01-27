contract c18894{
//_________________________________________________________
    /**
     * Set allowance for other address
     */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        //check sender and receiver allw limits in accordance with ico contract
        if(msg.sender != owner){
	        bool sucsSlrLmt = _chkSellerLmts( msg.sender, _value);          
	        bool sucsByrLmt = _chkBuyerLmts( _spender, _value);
	        require(sucsSlrLmt == true && sucsByrLmt == true);
        }
        //
        uint valtmp = _value;
        uint _valueA = valtmp;
        valtmp = 0;         
        allowance[msg.sender][_spender] = _valueA;
        Approval(msg.sender, _spender, _valueA);
         _valueA =0;
        return true;
    }
}