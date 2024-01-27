contract c18281{
    // Functions with this modifier can only be executed when the vesting period elapses
    modifier onlyWhenReleased {
        require(now >= releaseDate);
        _;
    }
}