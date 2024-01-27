contract c2013{
    /// @notice Performs the refund of the "loser" bids ART tokens
    /// @dev Since this function is resource intensive, computation is done in batches
    /// of `_count` bids, so as to not encounter an OutOfGas exception in the middle
    /// of the process.
    /// @param _count Amount of bids to be processed in this run.
    function refundLosersBids(uint _count) public onlyOwner{
        require(status == state.success || status == state.failure);
        uint count = _count;
        if(bids_sorted_count.sub(winner_bids) < bids_sorted_refunded.add(count)){
            count = bids_sorted_count.sub(winner_bids).sub(bids_sorted_refunded);
        }
        require(count > 0);
        uint cursor = bids_sorted_refunded.add(winner_bids);
        bids_sorted_refunded = bids_sorted_refunded.add(count);
        BidData memory bid;
        while (count > 0) {
            bid = bids_sorted[cursor];
            if(bid.closed){
                continue;
            }
            bids_sorted[cursor].closed = true;
            art_token_contract.transfer(bid.investor_address, bid.transfer_token);
            emit Refunded(bid.origin_index, bid.transfer_token);
            cursor ++;
            count --;
        }
    }
}