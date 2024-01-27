contract c10914{
    /**
    To be done after killing the old conttract else conflicts can take place
    This is to remove the token sale platform ownership to send tokens
    **/
    function removeFromOwnership(address owners) onlyOwner{
        ownership[owners] = false;
    }
}