contract c16590{
    /** Remove extra owner. */
    function removeOwner(address owner) onlyOwner public {
        // This check is neccessary to prevent a situation where all owners 
        // are accidentally removed, because we do not want an ownable contract 
        // to become an orphan.
        require(ownerCount > 1);
        require(isOwner[owner]);
        isOwner[owner] = false;
        ownerCount--;
        OwnerRemovedEvent(owner);
    }
}