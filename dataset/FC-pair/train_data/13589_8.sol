contract c13589{
    /**
    * @dev return token balance this contract has
    * @return _address token balance this contract has.
    */
    function balanceOfContract() public view returns (uint) {
        return token.balanceOf(this);
    }
}