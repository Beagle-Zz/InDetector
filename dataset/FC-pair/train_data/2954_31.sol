contract c2954{
    /**
     * @dev prepares compression data and fires event for buy or reload tx's
     */
    function endTx(uint256 _pID, uint256 _eth, uint256 _keys, LDdatasets.EventReturns memory _eventData_)
        private
    {
        _eventData_.compressedData = _eventData_.compressedData + (now * 1000000000000000000);
        _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;
        emit MonkeyEvents.onEndTx
        (
            _eventData_.compressedData,
            _eventData_.compressedIDs,
            plyr_[_pID].name,
            msg.sender,
            _eth,
            _keys,
            _eventData_.winnerAddr,
            _eventData_.winnerName,
            _eventData_.amountWon,
            _eventData_.newPot,
            _eventData_.genAmount,
            _eventData_.potAmount,
            airDropPot_
        );
    }
}