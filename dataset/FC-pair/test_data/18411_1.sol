contract c18411{
    /** Remove extra owner. */
    function removeOwner(address owner) onlyOwner public {
        require(isOwner[owner]);
        isOwner[owner] = false;
        OwnerRemovedEvent(owner);
    }
}