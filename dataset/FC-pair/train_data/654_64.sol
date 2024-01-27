contract c654{
    /**
        @dev Make a proposal and add to pending proposals
        @param methodId a string representing the function ie. 'renameHorsey()'
        @param parameter parameter to be used if invocation is approved
    */
    function makeProposal( uint8 methodId, uint256 parameter ) external
    onlyCLevelAccess()
    proposalAvailable()
    cooledDown()
    {
        currentProposal.timestamp = block.timestamp;
        currentProposal.parameter = parameter;
        currentProposal.methodId = methodId;
        currentProposal.proposer = msg.sender;
        delete currentProposal.yay;
        delete currentProposal.nay;
        proposalInProgress = true;
        emit NewProposal(methodId,parameter,msg.sender);
    }
}