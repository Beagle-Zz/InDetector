contract c2289{
    /**
    *
    * @dev get the user win round comment
    *
    * @param round the winning round number
    *
    * @return user comment
    */
    function userComment(uint round) whenNotPaused public view returns (address winner, bytes32 comma, bytes32 commb) {
        if (_history[_winners[round]].blacklist != FLAG_BLACKLIST) {
            return (_winners[round], _wincomma[round], _wincommb[round]);
        } else {
            return (0x0, 0x0, 0x0);
        }
    }
}