contract c16216{
    // called by participate() and the fallback function for obtaining (additional) entries
    function _raise(Participant storage _participant) private returns (
        uint256 _entries,
        uint256 _refund
    ) {
        // calculate the number of entries from the wei sent
        _entries = msg.value / deployment._valuePerEntry;
        require(_entries >= 1); // ensure we have at least one entry
        // update participant totals
        _participant._entries += _entries;
        _state._entries += _entries;
        // get previous fund's entries
        uint256 _previousFundEntries = (funds.length > 0) ?
            funds[funds.length - 1]._entries : 0;
        // create and save new fund with cumulative entries
        Fund memory _fund = Fund(msg.sender, _previousFundEntries + _entries);
        funds.push(_fund);
        // calculate partial entry refund
        _refund = msg.value % deployment._valuePerEntry;
        // refund any excess wei immediately (partial entry)
        if (_refund > 0) {
            msg.sender.transfer(_refund);
        }
    }
}