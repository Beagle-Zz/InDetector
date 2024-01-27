contract c12447{
    /**
     * before send NAC to subround controller need active subround
     */
    function activateSubRound(uint _subRoundIndex)
        onlyController
        public
    {
        // require current round is not open and pool active
        require(NLFunds[currentRound].isOpen == false && NLFunds[currentRound].isActivePool == true);
        // require sub round not open
        require(listSubRoundNLF[currentRound][_subRoundIndex].isOpen == false);
        //
        currentSubRound = _subRoundIndex;
        require(listSubRoundNLF[currentRound][_subRoundIndex].isCloseNacPool == false);
        listSubRoundNLF[currentRound][_subRoundIndex].isOpen = true;
        emit ActivateSubRound(_subRoundIndex, now);
    }
}