contract c2377{
    //==============================================================================
    //     _ _  _ _   | _  _ . _  .
    //    (_(_)| (/_  |(_)(_||(_  . (this + tools + calcs + modules = our softwares engine)
    //=====================_|=======================================================
    /**
     * @dev logic runs whenever a buy order is executed.  determines how to handle
     * incoming eth depending on if we are in an active round or not
     */
    function buyCore(uint256 _pID, uint256 _affID, RSdatasets.EventReturns memory _eventData_)
    private
    {
        // setup local rID
        uint256 _rID = rID_;
        // grab time
        uint256 _now = now;
        // if round is end, fire endRound
        if (_now > round_[_rID].end && round_[_rID].ended == false)
        {
            // end the round (distributes pot) & start new round
            round_[_rID].ended = true;
            _eventData_ = endRound(_eventData_);
            // build event data
            _eventData_.compressedData = _eventData_.compressedData + (_now * 1000000000000000000);
            _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;
            // fire buy and distribute event
            emit RSEvents.onBuyAndDistribute
            (
                msg.sender,
                plyr_[_pID].name,
                msg.value,
                _eventData_.compressedData,
                _eventData_.compressedIDs,
                _eventData_.winnerAddr,
                _eventData_.winnerName,
                _eventData_.amountWon,
                _eventData_.newPot,
                _eventData_.genAmount
            );
        }
        _rID = rID_;
        core(_rID, _pID, msg.value, _affID, _eventData_);
    }
}