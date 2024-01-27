contract c18278{
    // Refund poll
    function checkRefundPollDate() internal view returns(bool) {
        if(secondRefundPollDate > 0 && now >= secondRefundPollDate && now <= safeAdd(secondRefundPollDate, 1 days)) {
            return true;
        }
        for(uint i; i < refundPollDates.length; i++) {
            if(now >= refundPollDates[i] && now <= safeAdd(refundPollDates[i], 12 days)) {
                return true;
            }
        }
        return false;
    }
}