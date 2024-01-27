contract c2134{
    /**
     *
     * @dev let the user comment 64 letters for a winning round
     *
     * @param round the winning round
     *
     * @param a the first 32 letters comment
     *
     * @param b the second 32 letters comment
     *
     * @return user comment
     */
    function comment(uint round, bytes32 a, bytes32 b) whenNotPaused public {
        address winner = _winners[round];
        require(winner == msg.sender, 'not a winner');
        require(_history[winner].blacklist != FLAG_BLACKLIST, 'blacklisted');
        _wincomma[round] = a;
        _wincommb[round] = b;
    }
}