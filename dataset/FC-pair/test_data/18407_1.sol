contract c18407{
    /** Remove extra owner. */
    function removeOwner(address owner) onlyOwner public {
        require(isOwner[owner]);
        isOwner[owner] = false;
        OwnerRemovedEvent(owner);
    }
}