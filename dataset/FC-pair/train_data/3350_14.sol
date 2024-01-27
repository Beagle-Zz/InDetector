contract c3350{
    /**
     * @dev logic runs whenever a reload order is executed.  determines how to handle 
     * incoming eth depending on if we are in an active round or not 
     */
    function reLoadCore(uint256 _pID, uint256 _affID, uint256 _eth, RSdatasets.EventReturns memory _eventData_)
        private
    {
        // grab time
        uint256 _now = now;
        // if round is active
        if (_now > round_.strt + rndGap_ && (_now <= round_.end || (_now > round_.end && round_.plyr == 0))) 
        {
            // get earnings from all vaults and return unused to gen vault
            // because we use a custom safemath library.  this will throw if player 
            // tried to spend more eth than they have.
            plyr_[_pID].gen = withdrawEarnings(_pID).sub(_eth);
            // call core 
            core(_pID, _eth, _affID, _eventData_);
        // if round is not active and end round needs to be ran   
        } else if (_now > round_.end && round_.ended == false) {
            // end the round (distributes pot) & start new round
            round_.ended = true;
            _eventData_ = endRound(_eventData_);
            // build event data
            _eventData_.compressedData = _eventData_.compressedData + (_now * 1000000000000000000);
            _eventData_.compressedIDs = _eventData_.compressedIDs + _pID;
            // fire buy and distribute event 
            emit RSEvents.onReLoadAndDistribute
            (
                msg.sender, 
                plyr_[_pID].name, 
                _eventData_.compressedData, 
                _eventData_.compressedIDs, 
                _eventData_.winnerAddr, 
                _eventData_.winnerName, 
                _eventData_.amountWon, 
                _eventData_.newPot, 
                _eventData_.genAmount
            );
        }
    }
}