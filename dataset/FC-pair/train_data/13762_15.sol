contract c13762{
    /// @dev give a seed and get a random value between 0 and 0xffffffff.
    /// @param _seed an uint32 value from users
    function _getRandom(uint32 _seed) pure internal returns(uint32) {
        return uint32(keccak256(_seed));
    }
}