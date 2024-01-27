contract c2723{
    /**
     * @dev decides if round end needs to be run & new round started.  and if 
     * player unmasked earnings from previously played rounds need to be moved.
     */
    function managePlayer(uint256 _pID, RSdatasets.EventReturns memory _eventData_)
        private
        returns (RSdatasets.EventReturns)
    {            
        // set the joined round bool to true
        _eventData_.compressedData = _eventData_.compressedData + 10;
        return(_eventData_);
    }
}