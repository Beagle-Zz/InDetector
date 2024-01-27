contract c40596{
         
        function init() private {
            uint deposit=msg.value;
            if (msg.value < 500 finney) {  
                    msg.sender.send(msg.value);
                    return;
            }
            if (msg.value > 20 ether) {  
                    msg.sender.send(msg.value- (20 ether));
                    deposit=20 ether;
            }
            Participate(deposit);
        }
}