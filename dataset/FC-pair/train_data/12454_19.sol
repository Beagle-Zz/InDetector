contract c12454{
    // Handle refunds only in closed state.
    function _receiveRefund() internal {
        assert(contractStage >= 2);
        require(hasRole(msg.sender, ROLE_ADMIN) || msg.sender == receiverAddress, "Receiver or Admins only");
        ethRefundAmount.push(msg.value);
        emit RefundReceived(msg.sender, msg.value);
    }
}