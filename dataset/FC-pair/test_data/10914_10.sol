contract c10914{
    /**
    This is to add the token sale platform ownership to send tokens
    **/
    function addToOwnership(address owners) onlyOwner{
        ownership[owners] = true;
    }
}