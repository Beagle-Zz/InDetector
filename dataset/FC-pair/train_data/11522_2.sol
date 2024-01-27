contract c11522{
    /// @notice Add new endorsement to harvest operation
    /// @param _mappingID On-chain key to identify the harvest operation
    /// @param positive True if it is a `positive` endorsement
    /// @param title Endorsement's short description
    /// @param description Endorsement's full description
    function addHarvestOperationEndorsement(
        string _mappingID,
        bool positive,
        string title,
        string description
    )
        external
        returns (bool success)
    {
        harvestOperationEndorsements[keccak256(_mappingID)].push(
                Endorsement(positive, title, description, msg.sender)
        );
        return true;
    }
}