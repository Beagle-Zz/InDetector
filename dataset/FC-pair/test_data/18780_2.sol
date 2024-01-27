contract c18780{
    /// @notice Create a new reusable template and use it to ask a question
    /// @dev Template data is only stored in the event logs, but its block number is kept in contract storage.
    /// @param content The template content
    /// @param question A string containing the parameters that will be passed into the template to make the question
    /// @param arbitrator The arbitration contract that will have the final word on the answer if there is a dispute
    /// @param timeout How long the contract should wait after the answer is changed before finalizing on that answer
    /// @param opening_ts If set, the earliest time it should be possible to answer the question.
    /// @param nonce A user-specified nonce used in the question ID. Change it to repeat a question.
    /// @return The ID of the newly-created template, which is created sequentially.
    function createTemplateAndAskQuestion(
        string content, 
        string question, address arbitrator, uint32 timeout, uint32 opening_ts, uint256 nonce 
    ) 
        // stateNotCreated is enforced by the internal _askQuestion
    public payable returns (bytes32) {
        uint256 template_id = createTemplate(content);
        return askQuestion(template_id, question, arbitrator, timeout, opening_ts, nonce);
    }
}