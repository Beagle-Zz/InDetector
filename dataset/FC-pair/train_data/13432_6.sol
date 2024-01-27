contract c13432{
    /**
     * @notice Get the token balance of `owner`
     * @dev This function is part of the ERC20 standard
     * @param owner The wallet to get the balance of
     * @return {"balance": "The balance of `owner`"}
     */
    function balanceOf(
        address owner
    )
        public view returns (uint256 balance)
    {
        return balances[owner];
    }
}