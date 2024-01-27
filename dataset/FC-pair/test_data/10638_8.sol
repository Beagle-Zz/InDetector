contract c10638{
    /**
     * @dev Check is valid number
     */
    function isValidNumber(uint8 number) private view returns(bool) {
        return number >= minNumber && number <= maxNumber;
    }
}