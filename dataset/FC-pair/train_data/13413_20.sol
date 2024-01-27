contract c13413{
    /**
    @dev Checks if a poll exists
    @param _pollID The pollID whose existance is to be evaluated.
    @return Boolean Indicates whether a poll exists for the provided pollID
    */
    function pollExists(uint _pollID) constant public returns (bool exists) {
        return (_pollID != 0 && _pollID <= pollNonce);
    }
}