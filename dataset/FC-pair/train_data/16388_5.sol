contract c16388{
    /**
    * @dev Throws if called by any account that's frozen.
    */
    modifier notFrozen {
        require(!frozenAccounts[msg.sender]);
        _;
    }
}