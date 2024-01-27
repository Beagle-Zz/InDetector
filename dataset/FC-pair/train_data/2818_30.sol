contract c2818{
    /**
     * @dev prepares compression data and fires event for buy or reload tx's
     */
    function endTx(uint256 _pID, uint256 _team, uint256 _eth, uint256 _keys, BATMODatasets.EventReturns memory _eventData_)
        private
    {
        _eventData_.compressedData = _eventData_.compressedData + (now * 1000000000000000000) + (_team * 100000000000000000000000000000);
        _eventData_.compressedIDs = _eventData_.compressedIDs + _pID + (rID_ * 10000000000000000000000000000000000000000000000000000);
        emit FOMOEvents.onEndTx
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
            _eventData_.tokenAmount,
            _eventData_.genAmount,
            _eventData_.potAmount
        );
    }
}