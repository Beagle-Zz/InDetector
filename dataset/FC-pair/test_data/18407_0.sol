contract c18407{
    /** Add extra owner. */
    function addOwner(address owner) onlyOwner public {
        require(owner != address(0));
        require(!isOwner[owner]);
        ownerHistory.push(owner);
        isOwner[owner] = true;
        OwnerAddedEvent(owner);
    }
}