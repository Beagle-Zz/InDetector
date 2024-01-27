contract c7920{
    // change symbol and name
    function reconfig(string newName, string newSymbol) external onlyOwner {
        symbol = newSymbol;
        name = newName;
    }
}