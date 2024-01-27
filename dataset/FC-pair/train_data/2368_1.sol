contract c2368{
    // Shows the token balance of the ethereum wallet address if any 
    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return balanceOf[tokenOwner];  // ethereum wallet address is passed as argument
    }
}