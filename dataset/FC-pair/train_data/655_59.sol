contract c655{
    /**
        @dev Transfers knight ownership to a new address
        @param newKnight the new address
    */
    function transferKnightOwnership(address newKnight) external 
    validAddress(newKnight) {
        require(knightAddress == msg.sender,"Not right role");
        _moveBalance(newKnight);
        knightAddress = newKnight;
    }
}