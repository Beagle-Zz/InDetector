contract c2280{
    /**
    *@dev Deploys DRCT tokens for given start date
    *@param _start_date of contract
    */
    function deployTokenContract(uint _start_date) public{
        address _token;
        require(_start_date % 86400 == 0);
        require(long_tokens[_start_date] == address(0) && short_tokens[_start_date] == address(0));
        _token = new DRCT_Token();
        token_dates[_token] = _start_date;
        long_tokens[_start_date] = _token;
        token_type[_token]=2;
        _token = new DRCT_Token();
        token_type[_token]=1;
        short_tokens[_start_date] = _token;
        token_dates[_token] = _start_date;
        startDates.push(_start_date);
    }
}