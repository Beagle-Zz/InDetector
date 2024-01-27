contract c40367{
     
    modifier noValue() {
        if (msg.value > 0) {
             
             
             
            _safeSend(msg.sender, msg.value);
        }
        _;
    }
}