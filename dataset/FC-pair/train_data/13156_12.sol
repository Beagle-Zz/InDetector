contract c13156{
    // Accessor for the value in wei of selling a certain amount of tokens.
    function getSellValue(uint _amount) external view returns(uint) {
        return _amount.div(sellValue);
    }
}