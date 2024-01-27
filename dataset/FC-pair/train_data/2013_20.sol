contract c2013{
    /// @notice Assign the asset share tokens to winner bid's authors
    /// @dev Since this function is resource intensive, computation is done in batches
    /// of `_count` bids, so as to not encounter an OutOfGas exception in the middle
    /// of the process.
    /// @param _count Amount of bids to be processed in this run.
    function assignShareTokens(uint _count) public onlyOwner{
        require(status == state.success);
        uint count = _count;
        if(winner_bids < assigned_bids.add(count)){
            count = winner_bids.sub(assigned_bids);
        }
        require(count > 0);
        uint cursor = assigned_bids;
        assigned_bids = assigned_bids.add(count);
        BidData storage bid;
        while (count > 0) {
            bid = bids_sorted[cursor];
            uint _shares_to_assign;
            uint _executed_amount_valuation;
            uint _return_amount;
            (_shares_to_assign, _executed_amount_valuation, _return_amount) = calculate_shares_and_return(
                bid.shares_count,
                bid.share_price,
                bid.transfer_valuation,
                final_share_price,
                bids[bid.origin_index].art_price,
                bid.transfer_token
            );
            bid.executed_amount = _executed_amount_valuation;
            bid.asigned_shares_count = _shares_to_assign;
            assigned_shares = assigned_shares.add(_shares_to_assign);
            final_fundraise = final_fundraise.add(_executed_amount_valuation);
            final_shares_sold = final_shares_sold.add(_shares_to_assign);
            if(_return_amount > 0){
                art_token_contract.transfer(bid.investor_address, _return_amount);
            }
            bid.closed = true;
            if (shares_holders_balance[bid.investor_address] == 0){
                shares_holders[shares_holders_count++] = bid.investor_address;
            }
            emit Assigned(bid.origin_index,_shares_to_assign, _executed_amount_valuation, _return_amount);
            shares_holders_balance[bid.investor_address] = shares_holders_balance[bid.investor_address].add(_shares_to_assign);
            cursor ++;
            count --;
        }
    }
}