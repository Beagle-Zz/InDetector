contract c12447{
    // ------------------------------------------------ 
    /**
     * Admin function
     * Open and Close Round
     */
    function activateRound(uint _roundIndex)
        onlyEscrow
        public
    {
        // require round not open
        require(NLFunds[_roundIndex].isOpen == false);
        NLFunds[_roundIndex].isOpen = true;
        currentRound = _roundIndex;
        emit ActivateRound(_roundIndex, now);
    }
}