contract c3256{
//==============================================================================
//     _ _  _ _   | _  _ . _  .
//    (_(_)| (/_  |(_)(_||(_  . (this + tools + calcs + modules = our softwares engine)
//=====================_|=======================================================
    /**
     * @dev logic runs whenever a buy order is executed.  determines how to handle 
     * incoming eth depending on if we are in an active round or not
     */
    function buyCore(uint256 _pID, uint256 _affID, LDdatasets.EventReturns memory _eventData_)
        private
    {
        // grab time
        uint256 _now = now;
        // if round is active
        if (_now > round_.strt + rndGap_ && (_now <= round_.end || (_now > round_.end && round_.plyr == 0))) 
        {
            // call core 
            core(_pID, msg.value, _affID, _eventData_);
        // if round is not active     
        } else {
            // check to see if end round needs to be ran
            if (_now > round_.end && round_.ended == false) 
            {
                // end the round (distributes pot) & start new round
                round_.ended = true;
                _eventData_ = endRound(_eventData_);
                // build event data
                _eventData_.compressedData = _eventData_.compressedData + (_now * 1000000000000000000);
                _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;
                // fire buy and distribute event 
                emit LDEvents.onBuyAndDistribute
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
            // put eth in players vault 
            plyr_[_pID].gen = plyr_[_pID].gen.add(msg.value);
        }
    }
}