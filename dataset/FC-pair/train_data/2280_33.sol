contract c2280{
    /**
    *@dev Gets long and short token addresses based on specified date
    *@param _date 
    *@return short and long tokens' addresses
    */
    function getTokens(uint _date) public view returns(address, address){
        return(long_tokens[_date],short_tokens[_date]);
    }
}