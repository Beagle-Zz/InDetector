contract c8578{
    /**
     * @dev Suicides the entire smart contract
     */
    function suicideContract() public onlyAnyOwners {
        hasSuicided = true;
        emit SuicideContract(msg.sender);
    }
}