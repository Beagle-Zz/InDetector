contract c18277{
    /*
        @dev start crowdsale (any)
        @param _tokens - How much tokens will have the crowdsale - amount humanlike value (10000)
        @param _startDate - When crowdsale will be start - unix timestamp (1512231703)
        @param _endDate - When crowdsale will be end - humanlike value (7) same as 7 days
        @param _bonus - Bonus for the crowd - humanlive value (7) same as 7 %
    */
    function startCrowdsale(
        uint256 _tokens,
        uint    _startDate,
        uint    _endDate,
        uint8   _bonus
    )
        public
        onlyOwner
    {
        Crowd = Crowdsale (
            _tokens * DEC,
            _startDate,
            _startDate + _endDate * 1 days ,
            _bonus
            );
        saleStat = true;
    }
}