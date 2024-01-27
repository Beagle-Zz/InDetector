contract c10353{
    /**
     * @dev overrides burn function with modifier to prevent burn while untransferable
     * @param _value The amount to be burned.
     */
    function burn(uint _value) public onlyWhenTransferable onlyOwner {
        super.burn(_value);
    }
}