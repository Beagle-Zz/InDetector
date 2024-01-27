contract c2429{
    /**
    *@dev Gets the type of Token (long and short token) for the specifed 
    *token address
    *@param _token address 
    *@return token type short = 1 and long = 2
    */
    function getTokenType(address _token) public view returns(uint){
        return(token_type[_token]);
    }
}