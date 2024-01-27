contract c2445{
    /**
     * @dev Sets start and end dates for pre-sale phase_i
     * @param _presale_start Pre-sale sart date
     * @param _presale_end Pre-sale end date
     */
    function setPresaleDates(uint _presale_start, uint _presale_end) public onlyOwnerOrManager {
        _updatePhase(false);
        require(phase_i == PHASE_BEFORE_PRESALE, "Bad phase");
        // require(_presale_start >= now);
        require(_presale_start < _presale_end, "Invalid presale dates");
        require(_presale_end < ico_start, "Invalid dates");
        presale_start = _presale_start;
        presale_end = _presale_end;
    }
}