contract c16798{
    /*
    ** Modifier, reverting if not within limits.
    */
    modifier isWithinLimits(uint _amount) {
        require(withinLimits(_amount));
        _;
    }
}