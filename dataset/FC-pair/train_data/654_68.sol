contract c654{
    /**
        @dev Execute the proposal
    */
    function _doProposal() internal {
        /// UPDATE the renaming cost
        if( currentProposal.methodId == 0 ) HorseyToken(tokenAddress).setRenamingCosts(currentProposal.parameter);
        /// UPDATE the market fees
        if( currentProposal.methodId == 1 ) HorseyExchange(exchangeAddress).setMarketFees(currentProposal.parameter);
        /// UPDATE the legit dev addresses list
        if( currentProposal.methodId == 2 ) HorseyToken(tokenAddress).addLegitDevAddress(address(currentProposal.parameter));
        /// ADD a horse index to exchange
        if( currentProposal.methodId == 3 ) HorseyToken(tokenAddress).addHorseIndex(bytes32(currentProposal.parameter));
        /// PAUSE/UNPAUSE the dApp
        if( currentProposal.methodId == 4 ) {
            if(currentProposal.parameter == 0) {
                HorseyExchange(exchangeAddress).unpause();
                HorseyToken(tokenAddress).unpause();
            } else {
                HorseyExchange(exchangeAddress).pause();
                HorseyToken(tokenAddress).pause();
            }
        }
        /// UPDATE the claiming fees
        if( currentProposal.methodId == 5 ) HorseyToken(tokenAddress).setClaimingCosts(currentProposal.parameter);
        /// UPDATE carrots multiplier
        if( currentProposal.methodId == 8 ){
            HorseyToken(tokenAddress).setCarrotsMultiplier(uint8(currentProposal.parameter));
        }
        /// UPDATE rarity multiplier
        if( currentProposal.methodId == 9 ){
            HorseyToken(tokenAddress).setRarityMultiplier(uint8(currentProposal.parameter));
        }
        emit ProposalPassed(currentProposal.methodId,currentProposal.parameter,currentProposal.proposer);
    }
}