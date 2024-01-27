contract c7382{
    // only owner can submit tracked clicks (from ad server)
    function trackClick(address line_item_address, address ad_slot_address) public onlyOwner {
        emit clickTracked(line_item_address, ad_slot_address);
    }
}