contract c4176{
    // Token must be released to execute
    modifier onlyReleasedTokens(uint id) {
        require(isReleased(id));
        _;
    }
}