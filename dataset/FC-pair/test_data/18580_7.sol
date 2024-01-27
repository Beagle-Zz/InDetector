contract c18580{
    // ------------------------------------------------------------------------
    // Permite determinar cuantas VTA tiene un usuario permitido gastar
    // ------------------------------------------------------------------------
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}