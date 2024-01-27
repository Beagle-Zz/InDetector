contract c9584{
    // admin methods
    function setDEditor(bytes32 democHash, address editor, bool canEdit) onlyDemocOwner(democHash) external {
        backend.setDEditor(democHash, editor, canEdit);
    }
}