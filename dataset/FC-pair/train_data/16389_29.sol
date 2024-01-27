contract c16389{
    /// @dev If a sale is done using multiple rounds, allowing for better pricing structure, depending on
    /// on market demand and value of the ITM token. Is also set via the constructor
    /// @param _round Round label/count
    function setRound(uint8 _round) public ifAuthorized(msg.sender, APHRODITE) {
        round = _round;
    }
}