contract c12447{
    /**
     * user withdraw NAC from each subround of NLF funds for investor
     */
    function withdrawSubRound(uint _subRoundIndex) public {
        // require close deposit to subround
        require(listSubRoundNLF[currentRound][_subRoundIndex].isCloseNacPool == true);
        // user not ever withdraw nac in this subround
        require(isWithdrawnSubRoundNLF[currentRound][msg.sender][_subRoundIndex] == false);
        // require user have fci
        require(membersNLF[currentRound][msg.sender].fciNLF > 0);
        // withdraw token
        NamiCrowdSale namiToken = NamiCrowdSale(NamiAddr);
        uint nacReturn = (listSubRoundNLF[currentRound][_subRoundIndex].totalNacInSubRound.mul(membersNLF[currentRound][msg.sender].fciNLF)).div(NLFunds[currentRound].finalNAC);
        namiToken.transfer(msg.sender, nacReturn);
        isWithdrawnSubRoundNLF[currentRound][msg.sender][_subRoundIndex] = true;
    }
}