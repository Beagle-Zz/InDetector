contract c2270{
    /**
     *  @dev Return the numbers of items in the list per status.
     *  @return The numbers of items in the list per status.
     */
    function itemsCounts() public view returns (uint pending, uint challenged, uint accepted, uint rejected) {
        for (uint i = 0; i < itemsList.length; i++) {
            Item storage item = items[itemsList[i]];
            if (item.disputed) challenged++;
            else if (item.status == ItemStatus.Resubmitted || item.status == ItemStatus.Submitted) pending++;
            else if (item.status == ItemStatus.Registered) accepted++;
            else if (item.status == ItemStatus.Cleared) rejected++;
        }
    }
}