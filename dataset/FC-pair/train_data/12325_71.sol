contract c12325{
    /**
     * fall back function call from nami crawsale smart contract
     * deposit NAC to NAMI TRADE broker, invest to NETF and NLF funds
     */
    function tokenFallbackExchange(address _from, uint _value, uint _choose) onlyNami public returns (bool success) {
        require(_choose <= 2);
        if (_choose == 0) {
            // deposit NAC to nami trade broker
            require(_value >= minNac);
            emit Deposit(_from, _value, now);
        } else if(_choose == 1) {
            require(_value >= minNac && NLFunds[currentRound].isOpen == true);
            // invest to NLF funds
            membersNLF[currentRound][_from].fciNLF = membersNLF[currentRound][_from].fciNLF.add(_value);
            NLFunds[currentRound].currentNAC = NLFunds[currentRound].currentNAC.add(_value);
            emit InvestToNLF(_from, _value, now);
        } else if(_choose == 2) {
            // invest NAC to NETF Funds
            require(_value >= minNac); // msg.value >= 0.1 ether
            emit PlaceBuyFciOrder(_from, _value, now);
        }
        return true;
    }
}