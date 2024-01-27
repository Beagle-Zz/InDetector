contract c11522{
    /// @notice Add new endorsement to a winery operation
    /// @param _mappingID On-chain key to identify the winery operation
    /// @param _index Index of operation
    /// @param positive True if it is a `positive` endorsement
    /// @param title Endorsement's short description
    /// @param description Endorsement's full description
    function addWineryOperationEndorsement(
        string _mappingID,
        uint _index,
        bool positive,
        string title,
        string description
    )
        external
        returns (bool success)
    {
        wineryOperationEndorsements[keccak256(_mappingID, _index)].push(
                Endorsement(positive, title, description, msg.sender)
        );
        return true;
    }
}