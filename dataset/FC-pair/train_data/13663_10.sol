contract c13663{
    /**
     * Total number of deposits in the lifetime of the contract.
     */
    function totalParticipants() public view returns (uint256){
        return participants.length;
    }
}