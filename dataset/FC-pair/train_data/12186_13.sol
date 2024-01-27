contract c12186{
    /// @notice Used to look up balance of a person
    function balanceOf(address _person)
        public
        constant
        returns (uint256 _balance)
    {
        return balances[_person];
    }
}