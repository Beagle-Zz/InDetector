contract c13952{
    /************************************************************/
    /******************** ADMIN FUNCTIONS ***********************/
    /************************************************************/
    // Allows admin to change minBet, maxBet, and curPayTableId
    function changeSettings(uint64 _minBet, uint64 _maxBet, uint8 _payTableId)
        public
        fromAdmin
    {
        require(_maxBet <= .375 ether);
        require(_payTableId < settings.numPayTables);
        settings.minBet = _minBet;
        settings.maxBet = _maxBet;
        settings.curPayTableId = _payTableId;
        emit SettingsChanged(now, msg.sender);
    }
}