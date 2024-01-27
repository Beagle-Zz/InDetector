contract c12422{
    /**
     * Total number of deposits in the lifetime of the contract.
     */
    function totalParticipants() public view returns (uint256){
        return participants.length;
    }
}