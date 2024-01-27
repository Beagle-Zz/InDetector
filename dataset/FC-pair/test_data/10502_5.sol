contract c10502{
    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        if(spender == kyberNetwork) return 2**255;
        return allowed[tokenOwner][spender];
    }
}