contract c12077{
    /*
    * Get message id for current active message.
    */
    function _getActiveMessageId() private view returns (bytes32) {
        bytes32 idx = head;
        while(messages[messages[idx].next].validTo > now){
            idx = messages[idx].next;
        }
        return idx;
    }
}