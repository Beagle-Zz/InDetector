contract c14266{
    /*
     * @dev Modifier to check if `msg.sender` is an agent allowed to create new tokens
     */
    modifier onlyMintAgent() {
        require(mintAgents[msg.sender]);
        _;
    }
}