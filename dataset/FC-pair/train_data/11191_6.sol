contract c11191{
    /**
     * @dev Check is valid number
     */
    function isValidNumber(uint8 number) internal view returns(bool) {
        return number >= minNumber && number <= maxNumber;
    }
}