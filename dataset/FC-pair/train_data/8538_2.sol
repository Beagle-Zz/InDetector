contract c8538{
     // Get the token balance for account `tokenOwner`
     function balanceOf(address tokenOwner) public constant returns (uint balance) {
         return tokenBalances[tokenOwner];
     }
}