contract c12447{
    /**
     * controller get NAC from NLF pool to send to trader
     */
    function removeNacFromNLF(uint _value) public onlyController {
        require(NLFunds[currentRound].isActivePool == true);
        require(NLFunds[currentRound].withdrawable == false);
        NLFunds[currentRound].currentNAC = NLFunds[currentRound].currentNAC.sub(_value);
    }
}