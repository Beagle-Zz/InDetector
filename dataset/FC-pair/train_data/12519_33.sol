contract c12519{
    // After firing this function no more tokens can be created  
    function stopTokenMinting() public onlyOwner returns (bool success) {
        unmintedTokens = 0;
        return true;
    }
}