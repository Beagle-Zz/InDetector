contract c2013{
    /// @notice Allows resetting the entire bid decryption/appending process
    /// in case a mistake was made and it is not possible to continue appending further bids.
    function resetAppendDecryptedBids(uint _count) public onlyOwner{
        require(status == state.ended);
        require(bids_decrypted_count > 0);
        require(_count > 0);
        if (bids_reset_count == 0){
            bids_reset_count = bids_decrypted_count;
        }
        uint count = _count;
        if(bids_reset_count < count){
            count = bids_reset_count;
        }
        do {
            bids_reset_count--;
            bids[bids_decrypted[bids_reset_count]].is_decrypted = false;
            bids[bids_decrypted[bids_reset_count]].is_burned = false;
            bids[bids_decrypted[bids_reset_count]].will_compute = false;
            count--;
        } while(count > 0);
        if (bids_reset_count == 0){
            bids_sorted_count = 0;
            bids_ignored_count = 0;
            bids_decrypted_count = 0;
            bids_burned_count = 0;
        }
    }
}