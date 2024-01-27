contract c2986{
    /// @dev Interface function, can be overwritten by the superclass
    /// @param token Token which balance we will check and return
    /// @return The amount of tokens (in smallest denominator) the contract owns
    function tokensToBeReturned(ERC20Basic token) public returns (uint) {
      return token.balanceOf(this);
    }
}