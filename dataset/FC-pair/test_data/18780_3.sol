contract c18780{
    /// @notice Ask a new question and return the ID
    /// @dev Template data is only stored in the event logs, but its block number is kept in contract storage.
    /// @param template_id The ID number of the template the question will use
    /// @param question A string containing the parameters that will be passed into the template to make the question
    /// @param arbitrator The arbitration contract that will have the final word on the answer if there is a dispute
    /// @param timeout How long the contract should wait after the answer is changed before finalizing on that answer
    /// @param opening_ts If set, the earliest time it should be possible to answer the question.
    /// @param nonce A user-specified nonce used in the question ID. Change it to repeat a question.
    /// @return The ID of the newly-created question, created deterministically.
    function askQuestion(uint256 template_id, string question, address arbitrator, uint32 timeout, uint32 opening_ts, uint256 nonce) 
        // stateNotCreated is enforced by the internal _askQuestion
    public payable returns (bytes32) {
        require(templates[template_id] > 0); // Template must exist
        bytes32 content_hash = keccak256(template_id, opening_ts, question);
        bytes32 question_id = keccak256(content_hash, arbitrator, timeout, msg.sender, nonce);
        _askQuestion(question_id, content_hash, arbitrator, timeout, opening_ts);
        LogNewQuestion(question_id, msg.sender, template_id, question, content_hash, arbitrator, timeout, opening_ts, nonce, now);
        return question_id;
    }
}