contract c4895{
    // bid auction
    function fortune_bid(uint _idx) public payable idx_inrange(_idx) {
        require(fortune_arr[_idx].forsale, "fortune not for sale");
        require(now < fortune_arr[_idx].auction_end, "auction ended");
        require(msg.value > fortune_arr[_idx].current_bid, 
            "new bid has to be higher than current");
        // return the previous bid        
        if(fortune_arr[_idx].bid_cnt != 0) 
            pending_pay[fortune_arr[_idx].current_bidder] += 
                fortune_arr[_idx].current_bid;
        fortune_arr[_idx].current_bid = msg.value;
        fortune_arr[_idx].current_bidder = msg.sender;
        fortune_arr[_idx].bid_cnt += 1;
        emit event_bids(_idx);
    }
}