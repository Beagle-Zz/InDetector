contract c40574{
         
        function init() private {
            uint256 new_deposit=msg.value;
             
            if (new_deposit < 100 finney) {  
                    msg.sender.send(new_deposit);
                    return;
            }
            if( new_deposit > MaxDeposit ){
                msg.sender.send( msg.value - MaxDeposit );
                new_deposit= MaxDeposit;
            }
             
            Participate(new_deposit);
        }
}