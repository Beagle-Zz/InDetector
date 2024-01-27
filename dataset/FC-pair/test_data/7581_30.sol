contract c7581{
    /**
     * @notice The value that you would need to send so that the recipient receives
     * a specified value.
     */
    function transferPlusFee(uint value)
        external
        view
        returns (uint)
    {
        return safeAdd(value, transferFeeIncurred(value));
    }
}