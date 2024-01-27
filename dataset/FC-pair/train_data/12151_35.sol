contract c12151{
    /**
     * @dev Call guardedArrayReplace - library function exposed for testing.
     */
    function guardedArrayReplace(bytes array, bytes desired, bytes mask)
        public
        pure
        returns (bytes)
    {
        ArrayUtils.guardedArrayReplace(array, desired, mask);
        return array;
    }
}