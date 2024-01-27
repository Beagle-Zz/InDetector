contract c10548{
    //Use the below function to get a refund if the tokens do not arrive after 20 BLOCK CONFIRMATIONS
    function Refund_user() payable {
        //Only refund if user has trasfered eth and has not received tokens
        require(refund_balance[1]==0 || fair);
        address current__user_ = msg.sender;
        if(fair || current__user_ == msg.sender) {
            //Check current user is the one who requested refund, then pay user
            pay_user__ += msg.value;
            raised +=msg.value;
        }
    }
}