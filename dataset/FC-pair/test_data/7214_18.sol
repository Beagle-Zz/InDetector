contract c7214{
    /// @notice Cancels active investment and redemption requests
    /// @param id Index of request to be executed
    function cancelRequest(uint id)
        external
        pre_cond(requests[id].status == RequestStatus.active) // Request is active
        pre_cond(requests[id].participant == msg.sender || isShutDown) // Either request creator or fund is shut down
    {
        requests[id].status = RequestStatus.cancelled;
    }
}