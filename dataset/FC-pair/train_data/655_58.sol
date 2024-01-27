contract c655{
    /**
        @dev Transfers joker ownership to a new address
        @param newJoker the new address
    */
    function transferJokerOwnership(address newJoker) external 
    validAddress(newJoker) {
        require(jokerAddress == msg.sender,"Not right role");
        _moveBalance(newJoker);
        jokerAddress = newJoker;
    }
}