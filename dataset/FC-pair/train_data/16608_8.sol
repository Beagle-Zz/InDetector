contract c16608{
    // Transfer from one address to another taking into account ERC223 condition to verify that the to address is a contract or not
    function transferFrom(address from, address to, uint value) public returns (bool) {
        bytes memory empty;
        if (isContract(to)) {
            return transferToContract(to, value, empty, true);
        }
        else {
            return transferToAddress(to, value, empty, true);
        }
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(value);
        return true;
    }
}