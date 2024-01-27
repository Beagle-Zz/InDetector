contract c13952{
        // Logs an error, and optionally refunds user the _bet
        function _betFailure(string _msg, uint _bet, bool _doRefund)
            private
        {
            if (_doRefund) require(msg.sender.call.value(_bet)());
            emit BetFailure(now, msg.sender, _bet, _msg);
        }
}